{{ config(materialized='view') }}

with view_sales as (
  select 
		"nome do cliente" as "customer_name",
		"serviço prestado" as detail,
		status,
		REPLACE(REPLACE(REPLACE("valor total", 'R$ ', ''), '.', ''), ',', '.')::float as total,
		 TO_DATE("data de emissão", 'DD-MM-YYYY') as date,
		"número" as number
	from contaazul.sales
	where status != 'Cancelada'
)

select *
from view_sales
