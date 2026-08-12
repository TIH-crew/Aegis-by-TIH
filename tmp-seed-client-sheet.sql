delete from portal_client_sheet_month_logs where account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3';
delete from portal_client_sheet_policies where account_id = '3a842763-e5f2-43f7-87c2-2a5429738fb3';

with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medipost Pharmacy, Medi Logistics (Pty) Ltd & Kawari Wholesalers(Pty) Ltd',
    'Commercial',
    'CM-3892891',
    'Bryte',
    'Monthly',
    null,
    'October',
    310366.67,
    null,
    0
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No changes 
R310,366.67'),
    ('2026-05-01', 'No changes
R310,366.67'),
    ('2026-06-01', 'No changes
R310,366.67'),
    ('2026-07-01', 'No changes 
R310,366.67'),
    ('2026-08-01', 'No changes 
R310,366.67')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Kawari Wholesalers (Pty) Ltd FTRR&I',
    'Commercial',
    'B00000047',
    'Bryte',
    'Monthly',
    'Acc. Name: KAWARI WHOLESALERS PTY LTD
Bank: Absa
Acc. Number: 4060905723
Debit Date: 01st of each month',
    'July',
    12423.91,
    null,
    1
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No Changes 
R 12 423.91'),
    ('2026-05-01', 'No Changes
R 12 423.91'),
    ('2026-06-01', '15 June 2026:        
- 3x Samsung Galaxy Tab S6 Lite @ R9078 each - Item Cancelled
- 6x Pallet jacks @ R3000 each - Item Cancelled
- Acer PJ P1385 WB projector - Item Cancelled
- 16x PC''s or electronic equipment in administration offices @ R8,000 each - Item Cancelled
- 16x Telephone Handsets @ R2,000 each - Item Cancelled
- 11 x Printers @ R3000 each - Item Cancelled
- Galaxy Tab4, 16GB, 255.8mm(10.1") WXGALCD - Item Cancelled
- 40A4K Hisense 40'''' FHD Smart TV - Item Cancelled
- 1320995 First Tech 587959 x3 Batteries 4x Charg - Item Cancelled
- 30x 2D Mobile scanners with docking stations @ R10260 each (Cape Town) - Item Cancelled
 
1 August 2026 
- Move assist to Key Alliance Group 

New premium after changes : R 8 739.38'),
    ('2026-07-01', 'Monthly premium : R 8 721.38 
Credit : R 1 965.78 for amendments done in June 2026
Premium collection July 2026 : R 6 755.60'),
    ('2026-08-01', 'Assist amended to Key Alliance Group. 
Previous premium : R 8 721.38
New monthly premium : R 8 749.37')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medilogistics FTRR&I',
    'Commercial',
    'B00000050',
    'Bryte',
    'Monthly',
    'Acc. Name: Medilogistics FTRR&I
Acc. Number: 4079530535
Bank Name: Absa
Debit Date: 01 st of each month',
    'June',
    185131.2,
    null,
    2
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', '16 April 2026 
- NISSAN HARDBODY NP300 2.0i LWB P/U S/C FX87TZGP - Item Cancelled effective 1 November due to a claim 

14 August 2025 - Back dated
- TOYOTA AVANZA 1.3 S BS01ZFGP - Item Cancelled - Sold 
- CHEVROLET SPARK 1.2 L 5DR FC04MDGP - Item Cancelled - Sold 
- ISUZU KB 250D LEED P/U S/C FX59HNGP - Item Cancelled - Sold 
- ISUZU KB 250D LEED FLEETSIDE P/U S/C JC30VTGP - Item Cancelled - Sold 
- TOYOTA AVANZA 1.3 S BS01ZFGP - Item Cancelled - Sold
- CHEVROLET SPARK 1.2 L 5DR FC04MDGP - Item Cancelled
- ISUZU KB 250D LEED P/U S/C FX59HNGP - Item Cancelled - Sold
- ISUZU KB 250D LEED FLEETSIDE P/U S/C JC30VTGP - Item Cancelled- Sold 

20 April 2026
- FORD BANTAM 1.3i A/C P/U S/C BJ97PJGP - Item Cancelled - Sold
- TOYOTA AVANZA 1.3 S BT75WGGP - Item Cancelled - Sold 
- CHEVROLET SPARK PRONTO 1.2 F/C P/V DB87PGGP - Item Cancelled - Sold 
- NISSAN HARDBODY NP300 2.0i LWB P/U S/C DC37SBGP - Item Cancelled - Sold 
- ISUZU KB 250D LEED FLEETSIDE P/U S/C HF70KGGP - Item Cancelled - Sold 
- CHEVROLET UTILITY 1.4 S/C P/U CK11NPGP - Item Cancelled - Sold 
- CAMPMASTER ROADSTER 310 DW04WVGP - Item Cancelled - Sold 

Premium after changes : R 196 407.15 
Credit : R 31 046.79
Collection Amount: R 165 360.36'),
    ('2026-05-01', '14 August 2026 - Removed Backdated 
        FORD BANTAM 1.4 TDCi P/U S/C BJ97PJGP - Item Cancelled        

7 May 2026 
ALA TIGRE SK125-4 VPB610GP - Item Cancelled

1 April 2026 - Removed backdated 
        Isuzu D-Max 250C Fleetside S/C P/U MR02PDGP - Item Cancelled - Due to a claim 

Premium after changes : R 194 401.84 
Credit : R 7 560.89 
Collection amount : R 186 840.95'),
    ('2026-06-01', '1 May 2026 - Removed back dated 
 - Due to a claim VOLKSWAGEN POLO VIVO 1.4 5DR DD76HTGP - Item Cancelled

10 June 2026
- Isuzu D-Max 250 Ho Fleetside S/C P/U (MM code:28016225) JD14THGP Added - Rental vehicle 

15 June 2026
- Computer, Screen, Software & Accessories - Item Cancelled
- Honeywell Scanner - Item Cancelled
- Mecer PC & Screen - Item Cancelled
- RCT PC - Item Cancelled
- Zebra Printer GK420D - Item Cancelled
- Desktop Combo PC & Screen - Item Cancelled
- 2x Intel Computers @ R6,000 each - Item Cancelled
- 2x Samsung Monitors @ R1,500 each - Item Cancelled
- HP Laserjet Pro 1536 DNF - Item Cancelled
- HP Laserjet Pro 400 - Item Cancelled
- 20 x Honey Hyperion - Item Cancelled
- 20 x Honeywell USB - Item Cancelled
- Copykleer IN216304 Multifunctional M1536DNF Printer - Item Cancelled
- 10 x Handy CCD - Item Cancelled
- 3 x Honeywell Scanners & Stands - Item Cancelled
- 3 x Desktop PC & Accessories - Item Cancelled
- 64 x Honeywell Scanners - Item Cancelled
- 15 x Handy CCD Scanners & Stand - Item Cancelled
- 2 x Zebra Printers - Item Cancelled
- HP Laserjet M1217NFW MFP Printer - Item Cancelled
- HP Laserjet P2055DN Printer - Item Cancelled
- Canvio Basic 2TB USB 3.0 External Harddrive - Item Cancelled
- Epson Projector - Item Cancelled
-  CCTV Camera System - Item Cancelled
- Copykleer Multi Functional M1536 DNF Printer - Item Cancelled
- Computer & Mercer Screen & Software - Item Cancelled
- Software Microsoft Office - Item Cancelled
- Gigabite Chassis Desktop With Samsung Monitors - Item Cancelled
- 2x IntelH81 Computer & Accessories @ R5,392 each - Item Cancelled
- CCTV Camera Systems - Item Cancelled
- 2x Intel H110 Skylake Dual Core Celerondesktop Computer with Accessories @ R6,329 each - Item Cancelled
- 2 x USB CCD Scanner - Item Cancelled
-Lenovo Laptop & Accessories - Item Cancelled
- HP 250 G8 CEL - Item Cancelled
- 2x Mecer Computer workstations complete with flat screen monitor @ R6,000 each - Item Cancelled
- HP Laserjet Professional Fax, Scanner, Printer & Photocopier - Item Cancelled
- Computer & Asus Screen 15.6" - Item Cancelled
- Computer & Screen Mecer - Item Cancelled
- Computer & Screen Mercer - Item Cancelled
- Computer & Screen Mercer - Item Cancelled
- Computer Mecer Screen & Software - Item Cancelled
- Computer Mecer Screen & Software - Item Cancelled
- Mercer Computer and Screen - Item Cancelled
- Scanner Wireless x 4 R 2918 each - Item Cancelled
- 3x Samsung Galaxy Tab - Item Cancelled
- 3x Ulefone Armor X6 16GB Dual Sim Rugged Mobile Phones @ R2,399 each - Item Cancelled
- 2x Ulefone Armor X6 16GB Dual Sim Rugged Mobile phone @ R 2,400 each - Item Cancelled
- 3x Nokia Asha 300 @ R1,500 each - Item Cancelled
- 5x Blackberry 9790 Black @ R5,900 each - Item Cancelled
- 5x Ulefone Armor X6 16GB Dual Sim Rugged @ R2,400 each - Item Cancelled
- 7x Nokia Asha Cell phones - Item Cancelled
- Samsung Galaxy S4 (Ayanda) - Item Cancelled
- Samsung Galaxy Tablet 4 10'' - Item Cancelled
 - Blackberry 9790 White (Xolile S Mananzi) - Item Cancelled
- Blackberry 9790 White - Item Cancelled
- Nokia Asha 300 (Daniel Jobo) - Item Cancelled
- Samsung Galaxy Tab (Collin Snell) - Item Cancelled
- 2x Ulefone Armor X6 16GB Dual Sim Rugged mobile phone @ R2,400 each - Item Cancelled
- Mundo Steel Folding Trolley & Steel Folding Trolley - Item Cancelled
- Desktop computer(s) / Computer equipment - Item Cancelled


19 June 2026 
- Isuzu D-Max 250 Ho Fleetside S/C P/U (MM code:28016225) JD14THGP - Removed 

Premium after changes : R 187 770.34 
Credit : R 3 240.50
Collection amount : R 184 529.83'),
    ('2026-07-01', 'Monthly premium : R 187 770.34 
Credit : R 3 240.50 for amendments done in June 2026
Premium collection in July : R 184 529.83

30 June 2026
Isuzu D-Max 250C Fleetside S/C P/U (MM Code: 28016185) KS23BFGP rental vehicle added 
5 July 2026 
Isuzu D-Max 250C Fleetside S/C P/U (MM Code: 28016185) KS23BFGP  rental vehicle removed 
5 July 2026 
Volkswagen Polo Vivo 1.4 (5Dr) (MM Code: 64020701) CAA667344 rental vehicle added 
8 July 2026 
Volkswagen Polo Vivo 1.4 (5Dr) (MM Code: 64020701) CAA667344 rental vehicle removed 
7 July 2026 
Toyota Hilux 2.4 GD-6 RB SRX P/U S/C ( MM Code: 60039181) JD42VNGP rental vehicle added 
11 July 2026 
Toyota Hilux 2.4 GD-6 RB SRX P/U S/C ( MM Code: 60039181) JD42VNGP rental vehicle removed 
12 July 2026
        Suzuki Swift 1.2 GL+ MR22SXGP rental vehicle added 
15 July 2026
        Suzuki Swift 1.2 GL+ MR22SXGP rental vehicle removed 
1 December 2025 
Isuzu D-Max 250C Fleetside S/C P/U (MM Code: 28016185) MR02NJGP removed due to a claim 
13 July 2026 
Isuzu D-Max 1.9 Ddi HR S/C P/U LV23ZJGP rental vehicle added 
CHEVROLET UTILITY 1.4 A/C P/U S/C DY30FRG removed 
Ford Ecosport 1.5 TiVCT Ambiente (MM Code:22048300) DS72LDGP removed
Chevrolet Spark Pronto 1.2 F/C P/V (MM Code:10010500) FH08TNGP removed
16 July 2026 
Isuzu D-Max 1.9 Ddi HR S/C P/U LV23ZJGP rental vehicle removed 
21 July 2026
Isuzu D-Max 1.9 Ddi HR S/C P/U LV23ZJGP rental vehicle cover reinstated
22 July 2026
        TOYOTA STARLET 1.5 Xs MP32JNGP rental vehicle added
25 July 2026
Isuzu D-Max 1.9 Ddi HR S/C P/U LV23ZJGP rental vehicle removed.
27 July 2026
ISUZU NPR 400 F/C C/C CF38280 rental vehicle added 


Pro rata credit of R 9 791.18 for amendments done'),
    ('2026-08-01', 'Monthly premium : R 182 954.31
Pro rata credit for changes done in July 2026 : R 9 791.18
Premium collection in August 2026 : R 173 163.13 

8/1/2026
Assist amended to Key Alliance Group on all vehicles 

3 August 2026 
TOYOTA STARLET 1.5 Xs MP32JNGP rental vehicle removed
10 August 2026 
ISUZU NPR 400 F/C C/C CF38280 rental vehicle removed
29 July 2026
GWM Steed 5 2.0S S/C P/U (MM Code: 23515051)) MN67TLGP rental veihcle added
31 July 2026 
ISUZU KB 250D Leed Fleetside P/U S/C HC41ZNG rental vehicle added
4 August 2026 
ISUZU KB 250D Leed Fleetside P/U S/C HC41ZNG rental vehicle removed 
3 August 2026 
TOYOTA STARLET 1.5 Xs MP32JNGP rental vehicle reinstated 
11 August 2026 
TOYOTA STARLET 1.5 Xs MP32JNGP removed
7 August 2026
        Isuzu D-Max 250 C S/C P/U added
31 July 2026 
Amending address on the Office contents, Fire and and accidental damage section
Add 2 hubs under Fire, Accidental damage and office contents section
1 September 2026 
GWM Steed 5 2.0S S/C P/U (MM Code: 23515051)) MN67TLGP removed 


Pro rata debit for the above changes made : R 2 893.35 
Monthly premium : R 185 131.20')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medipost FTRR&I',
    'Commercial',
    'B00000048',
    'Bryte',
    'Monthly',
    'Acc. Holder: HH DURRHEIM (PTY) LTD T/A MEDIPOST PHARMACY
Acc. Number: 4051276402
Bank: Absa 
Debit Date: 01st of each month',
    'July',
    8275.85,
    null,
    3
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No Changes 
R 24 174.63'),
    ('2026-05-01', 'No Changes 
R 24 174.63'),
    ('2026-06-01', '29 May 2026 - Removed back dated 
- P3155DN Printers x 32 (R19000.00 each) - Item Cancelled

15 June 2026
- 4 x Nuvi 42 LM GPS - Item Cancelled
- Huawei Mate 20 Lite (Timothy Botha) - Item Cancelled
- Huawei Mate 20 Lite (Jonathan Komape) - Item Cancelled
- Huawei Mate 20 Lite (Aidan Muruvan) - Item Cancelled
- CAT S31 Smarphone (Quintin Els) - Item Cancelled
- Huawei Y6 2019 (Nick) - Item Cancelled
- Huawei Y6 2019 (Natasha) - Item Cancelled
- Huawei Y6 2019 (Brandon) - Item Cancelled
- Huawei Y6 2019 (Nlotando) - Item Cancelled
- Huawei Y6 2019 (Damien) - Item Cancelled
- Huawei Y6 2019 (Adnew) - Item Cancelled
- Huawei Y6 2019 (MIchelle) - Item Cancelled
- Huawei Y6 2019 (Zama) - Item Cancelled
- Huawei Y6 2019 (Tonqo) - Item Cancelled
- Huawei Y6 2019 (Tyonn) - Item Cancelled
- Huawei Y6 2019 (Ian) - Item Cancelled
- Huawei Y6 2019 (Andile) - Item Cancelled
- Huawei Y6 2019 (Savesh) - Item Cancelled
- Huawei Y6 2019 (Tshepo) - Item Cancelled
- Huawei Y6 2019 (Bessie) - Item Cancelled
- Huawei Y6 2019 (Cedric) - Item Cancelled
- LG K10 Smartphone (Munene) - Item Cancelled
- 16x Ulefone Armor X6 16GB Sim Rugged @ R2,399 each - Item Cancelled
- Samsung Tablet - Item Cancelled
- USB Scanners - Amended - Reduces Sum insured 
- Samsung 35" LED TV - Item Cancelled
- Monitor Screens - Item Cancelled
- Desktop Computers & Accessories - Amended
- Printers - Amended
- Harddrives - Item Cancelled
- Tablets - Item Cancelled
- 7012400 Esquire Tech 929262 x1 PC Box - Item Cancelled
- 1320303 Esquire 00929271 SSD Steyn - Item Cancelled
- 1320310 Esquire Tech 930055 x1 PC Box - BI - Item Cancelled
- 1320310 Esquire Tech 930060 x1 SSD - BI - Item Cancelled
- 1320310 First Tech 590735 x5 Wireless keyboard/m - Item Cancelled
- 1320312 Netlogix INV126433 Asus Battery - Item Cancelled
- 7012400 Esquire Tech 925719 x1 ASUS PC Box - Item Cancelled
- 7012400 Esquire Tech 925721 x1 MS Office - Item Cancelled
- 1320302 First Tech 588804 x1 Screen - Item Cancelled
- 1320303 Netlogix IN125910 x1 Laptop charger/plug - Item Cancelled
- 1320303 Esquire Tech 925722 x3 Mini PC''s - Item Cancelled
- 1320303 Esquire Tech 923670 x1 RAM - Item Cancelled
- 1320311 Esquire Tech 927586 x5 Screens - Item Cancelled
- 1320311 Netlogix IN126128 x2 HDD HP SAS 75G - Item Cancelled
- 1320311 Esquite Tech 925824 x5 Screens - Item Cancelled
- 1320311 Esquire Tech 923708 x10 Keyboard/Mouse - Item Cancelled
- 1320434 Esquire Tech 925723 x12 USB Keyboards - Item Cancelled
- Netlogix IN129799 x1 Mercer desktop PC - Item Cancelled
- Strategix SIT-INV112722 x18 Fileshare li - Item Cancelled
 - Netlogix IN129646 x5 Mercer 19.5 Monito - Item Cancelled
- Netlogix IN129648 x4 Mercer 19.5'' Monito - Item Cancelled
- Netlogix IN129794 x1 SSD Drive/Adaptor/U - Item Cancelled
 - Netlogix IN129693 x2 Hand scanners - Item Cancelled
- Netlogix IN129694 x1 Zebra Thermal print - Item Cancelled
- Netlogix IN129695 x5 Barcode scanners - Item Cancelled
- Netlogix IN129715 x10 Keyboard combo''s - Item Cancelled
- Netlogix IN129716 x5 SSD drives - Item Cancelled
- Netlogix IN129661 x2 HPE 600GB SAS HDD - Item Cancelled
- Honeydew USB Scanners @ R1248.30 Each - Item Cancelled
-  Honeywell Scanners @ R1248.30 Each - Item Cancelled
- Honeywell USB Scanners @ R1397 Each - Item Cancelled
- HP Laserjet Printer P2035 - Item Cancelled
- HP Laserjet Printer - Item Cancelled
- Longrange CCD USB Scanners @ R627 Each - Item Cancelled
- Mecer PC - Item Cancelled
- Multifunction DFN Printer - Item Cancelled
- Samsung Galaxy Tab (Dian Bester) - Item Cancelled
- Software Office 2016 Home and Business Microsoft - Item Cancelled
- Zebra Printers @ 4330.86 Each - Item Cancelled
- 21x Ulefone Armor X6 16GB Dual Sim - Item Cancelled
- 79x PM75 Mobile Device @ R9,123 each - Item Cancelled
- 1320302 Esquire 00929261x6 MS Office - Item Cancelled
- 1320311 Esquire Tech 929272 x10 Screens - Item Cancelled
- Netlogix IN128855 x10 Mercer Monitors - Item Cancelled
- Strategix SIT-INV112722 x82 Veeam backup - Item Cancelled
- 1320311 Strategix SIT - INV11643 x62 MSP Licences - Item Cancelled

Premium after changes : R 8 257.85 
Credit : R 9 440.91
Collection amount : R 0.00 
Remaining credit : R 1 183.06'),
    ('2026-07-01', 'R 8 257.85 monthly premium
R 1 183.06 credit for previous amendments done 
R 7 092.79 premium collected in July'),
    ('2026-08-01', 'No Changes: R 8 275.85')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medipost Pharmacy, Medi Logistics (Pty) Ltd & Kawari Wholesalers(Pty) Ltd',
    'Liability',
    'PI313688 (Pharmacists)',
    'RSUM',
    'Monthly',
    'No Debit Order - EFT paid Annually per pharmacist',
    'April',
    1665.0,
    null,
    4
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', '10 Phamasicts 
R 17 805.00'),
    ('2026-05-01', '22 Pharmasicts 
R 29 970.00'),
    ('2026-06-01', '11 Pharmasicts 
R 17 898.75'),
    ('2026-07-01', '20 Pharmacists'),
    ('2026-08-01', 'No Changes')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medipost Pharmacy, Medi Logistics (Pty) Ltd & Kawari Wholesalers(Pty) Ltd',
    'Liability',
    'PI309986 (Pharmacy)',
    'RSUM',
    'Monthly',
    null,
    'April',
    23985.0,
    null,
    5
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No Changes 
R 22 856.75'),
    ('2026-05-01', 'No Changes 
R 22 856.75'),
    ('2026-06-01', 'Renewal 
Premium prior renewal : R 22 586.75
Premium after renewal : R 23 985.00'),
    ('2026-07-01', 'No Changes ; R 23 985.00'),
    ('2026-08-01', 'No Changes ; R 23 985.00')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medipost Pharmacy, Medi Logistics (Pty) Ltd & Kawari Wholesalers(Pty) Ltd',
    'Liability',
    'SPL/SLFG/000040588 (Directors & Officers)',
    'iToo',
    'Monthly',
    'Acc. Name: Medipost Holdings (Pty) Ltd
Acc. Number: 4051276402
Bank: Absa',
    'September',
    6382.5,
    null,
    6
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No Changes : 
R 6 382.50 per month'),
    ('2026-05-01', 'No Changes : 
R 6 382.50 per month'),
    ('2026-06-01', 'No Changes : 
R 6 382.50 per month'),
    ('2026-07-01', 'No Changes : R 6 382.50'),
    ('2026-08-01', 'No Changes : R 6 382.50')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Medipost Pharmacy, Medi Logistics (Pty) Ltd & Kawari Wholesalers(Pty) Ltd',
    'Liability',
    'SPL/SLFG/000022013 (Cyber Liability)',
    'iToo',
    'Monthly',
    'Acc. Name: Medipost Holdings (Pty) Ltd
Acc. Number: 4051276402
Bank: Absa',
    'September',
    26596.25,
    null,
    7
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No changes : 
R 26 596.25 per month'),
    ('2026-05-01', 'No changes : 
R 26 596.25 per month'),
    ('2026-06-01', 'No changes : 
R 26 596.25 per month'),
    ('2026-07-01', 'No Changes : R 26 596.25'),
    ('2026-08-01', 'No Changes : R 26 596.25')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Kawari Wholesalers (Pty) Ltd and Medipost Pharmacy',
    'Marine',
    'SRT/MCC412 (Carriers Liability)',
    'Sapphire',
    'Monthly',
    null,
    'September',
    30700.8,
    null,
    8
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'No Changes : 
R 30 700.80'),
    ('2026-05-01', 'No Changes : 
R 30 700.80'),
    ('2026-06-01', 'No Changes : 
R 30 700.80'),
    ('2026-07-01', 'No Changes ; R 30 700.80'),
    ('2026-08-01', 'No Changes ; R 30 700.80')
) as m(period_month, log_text);


with upserted as (
  insert into portal_client_sheet_policies (
    account_id, insured_name, cover_type, policy_number, insurer, frequency,
    debit_details, renewal_month, monthly_premium, annual_once_off, sort_order
  ) values (
    '3a842763-e5f2-43f7-87c2-2a5429738fb3',
    'Kawari Wholesalers (Pty) Ltd and Medipost Pharmacy',
    'Marine',
    'SRT/MC240 (Decleration Basis)',
    'Sapphire',
    'Monthly',
    'No Debit order - EFT Paid Monthly',
    'September',
    91000.0,
    null,
    9
  )
  returning id
)
insert into portal_client_sheet_month_logs (account_id, sheet_policy_id, period_month, log_text)
select '3a842763-e5f2-43f7-87c2-2a5429738fb3', upserted.id, m.period_month::date, m.log_text
from upserted
cross join (values
    ('2026-04-01', 'R 196 372 995.05
R 90 822.51 per month'),
    ('2026-05-01', 'R 206 182 826.55
R 95 359.56 per month'),
    ('2026-06-01', 'R 251 719 529.71 
Await invoice'),
    ('2026-07-01', 'Declared amount : R 212 369 508.56
Premium : R 98 220.90'),
    ('2026-08-01', 'Await declared amount')
) as m(period_month, log_text);
