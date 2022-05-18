json.extract! transaction, :id, :tenant_id, :owner_id, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
