Sequel.migration do
  change do
    create_table(:cards) do
      primary_key :id
      String :name, null: false
      Integer :balance, null: false, default: 0
    end
  end
end
