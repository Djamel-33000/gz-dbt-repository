- name: int_orders_margin
    description: "Agrégation de la marge au niveau de la commande (orders_id)"
    columns:
      - name: orders_id
        tests:
          - unique
          - not_null
      - name: margin
        description: "Somme des marges de tous les produits de la commande"

