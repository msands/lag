class RemoveThreddedTables < ActiveRecord::Migration
  def up
    drop_table :friendly_id_slugs
    drop_table :thredded_categories
    drop_table :thredded_messageboard_groups
    drop_table :thredded_messageboard_users
    drop_table :thredded_messageboards
    drop_table :thredded_post_moderation_records
    drop_table :thredded_post_notifications
    drop_table :thredded_posts
    drop_table :thredded_private_posts
    drop_table :thredded_private_topics
    drop_table :thredded_private_users
    drop_table :thredded_topic_categories
    drop_table :thredded_topics
    drop_table :thredded_user_details
    drop_table :thredded_user_messageboard_preferences
    drop_table :thredded_user_preferences
    drop_table :thredded_user_private_topic_read_states
    drop_table :thredded_user_topic_follows
    drop_table :thredded_user_topic_read_states
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
