create or replace function check_if_delivered() returns trigger as $$
declare
    _status orderline_status;
begin
	select orderline.status
	into _status
	from orderline
	WHERE orderline.order_id = NEW.order_id
	AND orderline.shop_id = NEW.shop_id
	AND orderline.product_id = NEW.product_id
	AND orderline.sell_timestamp = NEW.sell_timestamp;
	if _status <> 'delivered' then
		RAISE NOTICE 'Complaint can only be made for delivered products.';
		return NULL;
	else
		return NEW;
	end if;
end
$$ language plpgsql;

create OR REPLACE trigger for_complaint_allow_trigger
before insert on delivery_complaint
for each row execute function check_if_delivered();
