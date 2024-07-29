-- Estados y fechas de ultimas revisiones, de la maquina mas solicitadas por servicios y planes de entrenamiento
SELECT
  md.estado,
  md.fecha_ultima_revision
FROM
  "MaquinaDetalle" md
  JOIN (
    SELECT
      combined.id_maquina,
      COUNT(*) AS request_count
    FROM
      (
        SELECT
          sm.id_maquina
        FROM
          "ServicioMaquina" sm
        UNION
        ALL
        SELECT
          pm.id_maquina
        FROM
          "PlanMaquina" pm
      ) combined
    GROUP BY
      combined.id_maquina
    ORDER BY
      request_count DESC
    LIMIT
      1
  ) AS m ON m.id_maquina = md.id_maquina;

-- Sabor del suplemento que mas esta en bodega
SELECT
  s.sabor
FROM
  "Suplemento" s
  LEFT JOIN "Producto" p ON p.id = s.id_producto
  LEFT JOIN "BodegaProducto" bp ON p.id = bp.id_producto
GROUP BY
  s.sabor
ORDER BY
  count(bp.id_producto)
LIMIT
  1;

-- Stock del producto mas vendido en el ultimo trimestre
SELECT
  p.stock
FROM
  "Producto" p
  JOIN "VentaProducto" vp ON p.id = vp.id_producto
  JOIN "Venta" v ON p.id_venta = v.id
WHERE
  v.fecha_ultima_revision >= NOW() - INTERVAL '3 month'
GROUP BY
  p.id,
  p.stock
ORDER BY
  COUNT(p.id) DESC
LIMIT
  1;

-- Sueldo y certificacinoes del entrenador que mas servicios y plan de entrernamiento ha realizado en el ultimo año