class CreateTrustlyEngineRequests < ActiveRecord::Migration
	def change
		create_table :trustly_engine_requests do |t|

			t.string :method
			t.string :uuid
			t.string :signature # Validated on before create
			t.integer :user_id
			t.string  :locale
			t.string :country
			t.decimal :amount # The amount to withdraw
			t.string  :currency
			t.string :ip
			t.string :phone_number
			t.string :first_name
			t.string :last_name
			t.string :nin # NationalIdentificationNumber
			t.string :address
			t.integer :status_id # The state of the withdrawal
			# status_ids: 0 => initated (default), 1 => user-proccessed, 2 => admin-denied, 3 => admin-approved

			t.timestamps

		end
	end
end
