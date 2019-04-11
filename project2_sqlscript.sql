-- unique bidders in 2018
-- unique new bidders in 2018
-- GMV from both groups
-- location data (country)
-- Split monthly
-- site 29(costco), 9(gamestop), 3(walmart)

-- marketplaces in aggregate - new users
select 
count(c.b_id) as amt_of_bidders,
sum(bs.winning_bid_usd) as amount_won,
DATE_FORMAT(bs.auction_end, '%Y-%m') as auction_date,
s.name as site,
bs.shipping_country_id as buyer_country,
CONCAT('$', FORMAT(sum(bs.winning_bid_usd) / count(c.b_id),2)) as average_won_per_person
from bid b
join bstock_order bs on b.id = bs.bid
join site s on b.site = s.id
join customer c on b.customer = c.id
left join customer c1 on c.id = c1.id and c1.created_at < c.created_at
where (b.bid_created between '2018-01-01' and '2018-12-31') AND 
(c1.created_at IS NULL and (c.created_at between '2018-01-01' and '2018-12-31')) and
b.site in (29, 9, 3)
group by auction_date, b.site;

-- aggregate old buyers
select 
count(c.b_id) as amt_of_bidders,
sum(bs.winning_bid_usd) as amount_won,
DATE_FORMAT(bs.auction_end, '%Y-%m') as auction_date,
s.name as site,
bs.shipping_country_id as buyer_country,
CONCAT('$', FORMAT(sum(bs.winning_bid_usd) / count(c.b_id),2)) as average_won_per_person
from bid b
join bstock_order bs on b.id = bs.bid
join site s on b.site = s.id
join customer c on b.customer = c.id
left join customer c1 on c.id = c1.id and c1.created_at < c.created_at
where (b.bid_created between '2018-01-01' and '2018-12-31') AND 
(c1.created_at IS NULL and (c.created_at < '2018-01-01')) and
b.site in (29, 9, 3)
group by auction_date, b.site;

