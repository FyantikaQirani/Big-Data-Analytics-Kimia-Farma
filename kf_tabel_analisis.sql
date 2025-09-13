-- -------------------------------------------------------------
-- QUERY: Membuat tabel ringkasan transaksi di Kimia Farma
-- Project: rakamin-academy-data-analyst
-- Dataset: Kimia_Farma_Dataset
-- Tabel output: kf_final_transaction
-- -------------------------------------------------------------

CREATE TABLE `rakamin-academy-data-science-1.Kimia_Farma_Dataset.summary_transaksi` AS

-- Bagian CTE (Common Table Expression) untuk menyusun data utama
WITH main AS (
  SELECT
    -- Informasi transaksi dasar
    t.transaction_id,
    t.date,
    t.branch_id,

    -- Informasi cabang dari tabel kantor_cabang
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,

    -- Informasi pelanggan dan produk
    t.customer_name,
    t.product_id,
    p.product_name,
    p.price AS actual_price,
    t.discount_percentage,

    -- Perhitungan persentase gross laba berdasarkan kategori harga produk
    CASE
      WHEN p.price <= 50000 THEN 0.10
      WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
      WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
      WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,

    -- Perhitungan nilai penjualan bersih setelah diskon
    p.price * (1 - t.discount_percentage) AS nett_sales 
  
  FROM
    `rakamin-academy-data-science-1.Kimia_Farma_Dataset.kf_final_transaction` AS t

    -- Join dengan data cabang berdasarkan branch_id
    LEFT JOIN `rakamin-academy-data-science-1.Kimia_Farma_Dataset.kf_kantor_cabang` AS c
      ON t.branch_id = c.branch_id

    -- Join dengan data produk berdasarkan product_id
    LEFT JOIN `rakamin-academy-data-science-1.Kimia_Farma_Dataset.kf_product` AS p
      ON t.product_id = p.product_id
)

-- Mengambil data dari CTE 'main' dan menambahkan informasi profit serta rating transaksi
SELECT DISTINCT
  main.*,

  -- Perhitungan laba bersih berdasarkan gross laba dikurangi selisih diskon
  (actual_price * persentase_gross_laba) - (actual_price - nett_sales) AS nett_profit,

  -- Menambahkan rating transaksi dari tabel transaksi
  t.rating AS rating_transaksi

FROM
  main

  -- Join ulang ke tabel transaksi untuk mengambil nilai rating_transaksi
  JOIN `rakamin-academy-data-science-1.Kimia_Farma_Dataset.kf_final_transaction` AS t
    ON main.transaction_id = t.transaction_id

-- Mengurutkan hasil berdasarkan tanggal transaksi terbaru
ORDER BY
  date DESC;

