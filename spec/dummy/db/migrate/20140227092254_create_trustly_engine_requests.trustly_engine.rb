# This migration comes from trustly_engine (originally 20140214092145)
class CreateTrustlyEngineRequests < ActiveRecord::Migration
	def change
		create_table :trustly_engine_requests do |t|

			t.string :method
			t.string :uuid
			t.text :signature # Validated on before create
			t.integer :user_id
			t.string :locale
			t.string :country
			t.decimal :amount # The amount to withdraw
			t.string :currency
			t.string :ip
			t.string :phone_number
			t.string :email
			t.string :first_name
			t.string :last_name
			t.string :nin # NationalIdentificationNumber
			t.string :address
			t.integer :status_id, :default => 0 # The state of the withdrawal

			# Status_ids: 
			# 0 => initated (default) 
			# 1 => user-proccessed
			# 2 => admin-denied
			# 3 => admin-approved

			# For trustly notifications.
			t.string :order_id
			t.string :request_timestamp
			t.string :message_id
			t.string :notification_id

			t.timestamps

		end
	end
end
