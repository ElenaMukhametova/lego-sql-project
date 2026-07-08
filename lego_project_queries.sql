with total as (select year as year, count(*) as amount from sets group by year ) select total.year, total.amount, sum(total.amount) over (order by year asc) from total order by year asc
14:27:50
select themes.name as name, sum(quantity) as amount from inventory_sets left join sets on inventory_sets.set_num = sets.set_num left join themes on themes.id = sets.theme_id group by themes.name order by amount desc
14:27:24
select part_categories.name as name, sum(quantity) as amount from inventory_parts left join parts on inventory_parts.part_num = parts.part_num left join part_categories on parts.part_cat_id = part_categories.id group by part_categories.name order by amount desc
14:26:26
SELECT name, parent_id FROM themes WHERE name = 'Sculptures';
14:25:59
select themes.name, sets.name, max(num_parts) as max from sets left join themes on sets.theme_id = themes.id group by themes.name, sets.name order by max desc
14:25:09
select themes.name, sum(num_parts) as amount from sets left join themes on sets.theme_id = themes.id group by themes.name order by amount desc
14:24:41
SELECT themes.name, count(*) as amount from sets left join themes on sets.theme_id = themes.id group by themes.name order by amount desc
14:24:22
select colors.name as color, sum(quantity) as quantity from inventory_parts left join colors on inventory_parts.color_id = colors.id group by color order by quantity desc
14:23:55
SELECT sum(quantity) FROM inventory_parts
14:23:32
SELECT sum(quantity) FROM inventory_sets
14:23:12
SELECT 'colors (Цвета)' AS "Таблица", count(*) AS "Количество строк" FROM colors UNION ALL SELECT 'themes (Темы)', count(*) FROM themes UNION ALL SELECT 'part_categories (Категории)', count(*) FROM part_categories UNION ALL SELECT 'sets (Наборы)', count(*) FROM sets UNION ALL SELECT 'parts (Детали)', count(*) FROM parts UNION ALL SELECT 'inventories (Инвентарь)', count(*) FROM inventories UNION ALL SELECT 'inventory_sets (Содержимое наборов)', count(*) FROM inventory_sets UNION ALL SELECT 'inventory_parts (Спецификации деталей)', count(*) FROM inventory_parts;
14:22:41
CREATE TABLE inventory_parts ( inventory_id INTEGER, part_num VARCHAR(255), color_id INTEGER, quantity INTEGER, is_spare VARCHAR(255), FOREIGN KEY(inventory_id) REFERENCES inventories(id), FOREIGN KEY(color_id) REFERENCES colors(id) )
14:18:44
CREATE TABLE inventory_sets ( inventory_id INTEGER, set_num VARCHAR(255), quantity INTEGER, FOREIGN KEY(inventory_id) REFERENCES inventories(id), FOREIGN KEY(set_num) REFERENCES sets(set_num) )
14:18:23
CREATE TABLE inventories ( id INTEGER PRIMARY KEY, version INTEGER, set_num VARCHAR (255), FOREIGN KEY(set_num) REFERENCES sets(set_num) )
14:18:13
CREATE TABLE sets ( set_num VARCHAR (255) PRIMARY KEY, name VARCHAR (255), year INTEGER, theme_id INTEGER, num_parts INTEGER, FOREIGN KEY(theme_id) REFERENCES themes(id) )
14:18:01
CREATE TABLE parts ( part_num VARCHAR (255) PRIMARY KEY, name VARCHAR (255), part_cat_id INTEGER, FOREIGN KEY(part_cat_id) REFERENCES part_categories(id) )
14:17:52
CREATE TABLE part_categories ( id INTEGER PRIMARY KEY, name VARCHAR (255) )
14:17:37
CREATE TABLE themes ( id INTEGER PRIMARY KEY, name VARCHAR (255), parent_id INTEGER )
14:17:23
CREATE TABLE colors ( id INTEGER PRIMARY KEY, name VARCHAR (255), rgb VARCHAR (255), is_trans VARCHAR (255) )
14:17:04
DROP TABLE IF EXISTS inventory_parts, inventory_sets, inventories, parts, sets, part_categories, themes, colors, items, order_items, orders CASCADE;
14:16:12
with total as (select
        year as year,
        count(*) as amount
from sets
group by year
)

select
total.year,
total.amount,
sum(total.amount) over (order by year asc)
from total
order by year asc
1
Total rows: 66
Query complete 00:00:00.091
CRLF
Ln 1, Col 22