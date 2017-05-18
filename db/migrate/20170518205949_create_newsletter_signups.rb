class CreateNewsletterSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletter_signups do |t|
      t.string :email
      t.string :signup_ip

      t.timestamps
    end
  end
end
