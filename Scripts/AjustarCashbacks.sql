select *
from empresas e
where e.fantasia ilike '%%';
--

-- 1.1 - Criar tabelas de backup
-- insert into tkXXXX_bkp_cashback_items
-- create table tkXXXX_bkp_cashbacks as
select c.*
from cashbacks c
         inner join cashback_items ci on c.id = ci.cashback_id
where c.dh_lancamento::date between '2024-10-21' and '2024-10-23'
  and c.empresa_id = ''
  and c.tipo_cashback = 'NORMAL'
  and c.situacao_cashback = 'ATIVO'
  and ci.value_resgatado = 0
order by c.id
;


-- 1.2 - Atualizar valor_cashback em tkXXXX_bkp_cashbacks
update cashbacks c
set valor_cashback = round((c.valor_compra - (c.vl_desconto_adicional / 100) - c.valor_resgate) * 0.1, 2)
where c.empresa_id = ''
  and c.dh_lancamento::date between '2024-10-21' and '2024-10-23'
  and c.tipo_cashback = 'NORMAL'
  and c.situacao_cashback = 'ATIVO'
  and c.valor_resgatado = 0;

-- Validar backup
select *
from tkxxxx_bkp_cashbacks c;

-- Limpar backup
truncate table tkxxxx_bkp_cashbacks;


-- 2.1 - Atualizar valor_cashback em tk3467_bkp_cashback_items
update cashback_items ci
set valor_cashback = round((ci.valor_compra -
                            ((c.vl_desconto_adicional / 100) /
                             (select count(ci.cashback_id)
                              from cashbacks c
                                       inner join cashback_items ci on c.id = ci.cashback_id
                              group by ci.cashback_id
                              limit 1)) -
                            (c.valor_resgate /
                             (select count(ci.cashback_id)
                              from cashbacks c
                                       inner join cashback_items ci on c.id = ci.cashback_id
                              group by ci.cashback_id
                              limit 1))), 2) *
                     ((select i.percentual from items i where i.empresa_id = '2320' and i.id = ci.item_id) / 100)
from cashbacks c
where c.id = ci.cashback_id
  and c.empresa_id = ''
  and c.dh_lancamento::date between '2024-10-21' and '2024-10-23'
  and c.tipo_cashback = 'NORMAL'
  and c.situacao_cashback = 'ATIVO'
  and ci.value_resgatado = 0;


-- Validar backup
select *
from tkxxxx_bkp_cashback_items ci;

-- Limpar backup
truncate table tkxxxx_bkp_cashback_items;
