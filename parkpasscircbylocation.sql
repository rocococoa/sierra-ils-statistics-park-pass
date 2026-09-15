/*
Shows circulation data for CA Park Passes, CA Park Pass Backpack Kits, and SCC Parks Passes separated by location. 
Includes ytd circ numbers, current holds, and number of actively circulating items.
Created AGW 2/2026 
*/

WITH hold_counts AS (
    SELECT
        h.record_id AS bib_record_id,
        COUNT(h.id) AS hold_count
    FROM
        sierra_view.hold h
    GROUP BY
        1
)

SELECT 
    brp.best_title, 
    i.location_code,
    COUNT(DISTINCT CASE 
        WHEN i.item_status_code NOT IN ('$', 'n', 'w') THEN i.id 
        ELSE NULL 
    END) AS item_total_active, 
    SUM(i.year_to_date_checkout_total) AS YTD_total,
    COALESCE(hc.hold_count, 0) AS "Holds"
FROM sierra_view.bib_record_property brp
JOIN sierra_view.bib_record_item_record_link bri ON bri.bib_record_id = brp.bib_record_id
JOIN sierra_view.item_record i ON i.id = bri.item_record_id
LEFT JOIN hold_counts hc ON hc.bib_record_id = brp.bib_record_id
WHERE brp.material_code = '9'
GROUP BY 
    brp.best_title, 
    i.location_code, 
    hc.hold_count
ORDER BY 1, 2;

;