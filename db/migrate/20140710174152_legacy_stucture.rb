class LegacyStucture < ActiveRecord::Migration
  def change

    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    enable_extension "uuid-ossp"

    create_table "api_keys", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
      t.integer "user_id"
      t.integer "organization_id"
    end

    add_index "api_keys", ["organization_id"], name: "index_api_keys_on_organization_id", using: :btree
    add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

    create_table "campaign_books", force: true do |t|
      t.integer  "campaign_id"
      t.string   "name"
      t.integer  "weight",        default: 0
      t.integer  "parent_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "permission_id", default: 1
      t.integer  "user_id"
      t.json     "data",          default: {}
    end

    add_index "campaign_books", ["campaign_id"], name: "index_campaign_books_on_campaign_id", using: :btree
    add_index "campaign_books", ["parent_id", "weight"], name: "index_campaign_books_on_parent_id_and_weight", using: :btree

    create_table "campaign_discussion_comments", force: true do |t|
      t.integer  "campaign_discussion_id"
      t.integer  "user_id"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "campaign_discussion_comments", ["campaign_discussion_id"], name: "index_campaign_discussion_comments_on_campaign_discussion_id", using: :btree

    create_table "campaign_discussions", force: true do |t|
      t.integer  "campaign_id"
      t.integer  "user_id"
      t.string   "name"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "last_user_id"
      t.integer  "post_count",    default: 0
      t.integer  "permission_id", default: 1
      t.boolean  "active",        default: true
    end

    add_index "campaign_discussions", ["campaign_id"], name: "index_campaign_discussions_on_campaign_id", using: :btree
    add_index "campaign_discussions", ["updated_at"], name: "index_campaign_discussions_on_updated_at", using: :btree

    create_table "campaign_game_formats", force: true do |t|
      t.integer  "campaign_id"
      t.integer  "game_format_id"
      t.json     "data",           default: {}
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "campaign_game_formats", ["campaign_id"], name: "index_campaign_game_formats_on_campaign_id", using: :btree
    add_index "campaign_game_formats", ["game_format_id"], name: "index_campaign_game_formats_on_game_format_id", using: :btree

    create_table "campaign_metatags", id: false, force: true do |t|
      t.integer  "campaign_id"
      t.integer  "metatag_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "campaign_metrics", id: false, force: true do |t|
      t.integer "campaign_id"
      t.integer "character_count"
      t.integer "roleplay_count"
      t.integer "page_count"
      t.integer "like_count"
    end

    add_index "campaign_metrics", ["campaign_id"], name: "index_campaign_metrics_on_campaign_id", using: :btree

    create_table "campaign_users", id: false, force: true do |t|
      t.integer  "user_id"
      t.integer  "campaign_id"
      t.boolean  "approved"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.json     "permissions"
      t.json     "wiki_permissions"
      t.json     "data",             default: {}
      t.boolean  "pinned",           default: false
      t.integer  "status",           default: 0
    end

    add_index "campaign_users", ["campaign_id"], name: "index_campaign_users_on_campaign_id", using: :btree
    add_index "campaign_users", ["user_id"], name: "index_campaign_users_on_user_id", using: :btree

    create_table "campaigns", force: true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.boolean  "active",               default: true
      t.boolean  "group_wiki",           default: true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "system_id"
      t.boolean  "looking_for_player",   default: true
      t.integer  "permission_id",        default: 1
      t.integer  "image_id",             default: 0
      t.string   "system_name_override"
      t.boolean  "pending_upload",       default: false
      t.datetime "next_game_at"
      t.integer  "max_players"
      t.string   "game_format_text"
      t.text     "game_location"
      t.integer  "game_length"
      t.integer  "maturity_rating_id",   default: 1
      t.boolean  "auto_approve"
      t.json     "data",                 default: {}
      t.integer  "genre_id"
    end

    add_index "campaigns", ["genre_id"], name: "index_campaigns_on_genre_id", using: :btree
    add_index "campaigns", ["looking_for_player"], name: "index_campaigns_on_looking_for_player", using: :btree
    add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

    create_table "character_journals", force: true do |t|
      t.string   "name"
      t.integer  "character_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "campaign_id"
      t.integer  "permission_id", default: 1
      t.json     "data",          default: {}
    end

    add_index "character_journals", ["campaign_id"], name: "index_character_journals_on_campaign_id", using: :btree
    add_index "character_journals", ["character_id", "created_at"], name: "index_character_journals_on_character_id_and_created_at", using: :btree

    create_table "character_metadata", id: false, force: true do |t|
      t.integer "character_id"
      t.string  "name"
      t.string  "value"
      t.integer "meta_group"
    end

    add_index "character_metadata", ["character_id"], name: "index_character_metadata_on_character_id", using: :btree
    add_index "character_metadata", ["meta_group"], name: "index_character_metadata_on_meta_group", using: :btree

    create_table "character_metrics", id: false, force: true do |t|
      t.integer "character_id"
      t.integer "journal_count"
      t.integer "message_count"
      t.integer "likes"
    end

    add_index "character_metrics", ["character_id"], name: "index_character_metrics_on_character_id", using: :btree

    create_table "characters", force: true do |t|
      t.string   "name"
      t.string   "concept"
      t.boolean  "active"
      t.integer  "user_id"
      t.integer  "campaign_id"
      t.integer  "image_id",       default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "quote"
      t.string   "nickname"
      t.integer  "system_id"
      t.boolean  "npc"
      t.integer  "permission_id",  default: 1
      t.boolean  "pending_upload", default: false
      t.json     "data",           default: {}
    end

    add_index "characters", ["campaign_id"], name: "index_characters_on_campaign_id", using: :btree
    add_index "characters", ["npc"], name: "index_characters_on_npc", using: :btree
    add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

    create_table "game_formats", force: true do |t|
      t.string "name"
      t.json   "data", default: {}
    end

    create_table "genres", force: true do |t|
      t.string "name"
      t.string "short_name"
      t.text   "content"
    end

    create_table "images", force: true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.string   "md5"
      t.boolean  "secure",     default: false
      t.integer  "file_size"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "format",     default: "jpg"
    end

    add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

    create_table "invitation_codes", force: true do |t|
      t.integer  "used"
      t.integer  "available"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "invitations", force: true do |t|
      t.string   "email"
      t.json   "groups"
      t.json   "campaigns"
      t.boolean  "approved"
      t.boolean  "complete"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "emails_sent", default: 0
    end

    add_index "invitations", ["email"], name: "index_invitations_on_email", using: :btree

    create_table "journal_metrics", id: false, force: true do |t|
      t.integer "character_journal_id"
      t.integer "view_count"
      t.integer "comment_count"
      t.integer "like_count"
    end

    add_index "journal_metrics", ["character_journal_id"], name: "index_journal_metrics_on_character_journal_id", using: :btree

    create_table "likes", id: false, force: true do |t|
      t.integer "item_id"
      t.string  "item_type"
      t.integer "user_id"
    end

    add_index "likes", ["item_id", "item_type"], name: "index_likes_on_item_id_and_item_type", using: :btree
    add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

    create_table "message_comments", force: true do |t|
      t.integer  "message_id"
      t.integer  "user_id"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "message_users", id: false, force: true do |t|
      t.integer "user_id"
      t.integer "message_id"
      t.boolean "active",     default: true
    end

    add_index "message_users", ["message_id"], name: "index_message_users_on_message_id", using: :btree
    add_index "message_users", ["user_id", "active"], name: "index_message_users_on_user_id_and_active", using: :btree

    create_table "messages", force: true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "post_count",   default: 0
      t.integer  "last_user_id"
      t.text     "content"
    end

    create_table "metatags", force: true do |t|
      t.string "name"
      t.string "short_name"
      t.text   "content"
    end


    create_table "organizations", force: true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.json   "admin",      default: {}
      t.json     "data",       default: {}
      t.boolean  "su",         default: false
    end

    create_table "roleplay_characters", id: false, force: true do |t|
      t.integer  "roleplay_id"
      t.integer  "user_id"
      t.integer  "character_id"
      t.boolean  "approved"
      t.text     "message"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "roleplay_characters", ["roleplay_id", "character_id"], name: "index_roleplay_characters_on_roleplay_id_and_character_id", using: :btree
    add_index "roleplay_characters", ["roleplay_id", "user_id"], name: "index_roleplay_characters_on_roleplay_id_and_user_id", using: :btree
    add_index "roleplay_characters", ["roleplay_id"], name: "index_roleplay_characters_on_roleplay_id", using: :btree

    create_table "roleplay_comments", force: true do |t|
      t.integer  "user_id"
      t.integer  "roleplay_id"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "roleplay_message_id"
    end

    add_index "roleplay_comments", ["roleplay_message_id"], name: "index_roleplay_comments_on_roleplay_message_id", using: :btree

    create_table "roleplay_message_tags", id: false, force: true do |t|
      t.integer  "character_id"
      t.integer  "roleplay_message_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "roleplay_message_tags", ["roleplay_message_id"], name: "index_roleplay_message_tags_on_roleplay_message_id", using: :btree

    create_table "roleplay_messages", force: true do |t|
      t.text     "content"
      t.integer  "character_id"
      t.integer  "user_id"
      t.integer  "roleplay_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.json     "roll"
      t.string   "name_override"
      t.integer  "reroll_count",  default: 0
    end

    add_index "roleplay_messages", ["roleplay_id"], name: "index_roleplay_messages_on_roleplay_id", using: :btree
    add_index "roleplay_messages", ["user_id"], name: "index_roleplay_messages_on_user_id", using: :btree

    create_table "roleplay_metrics", id: false, force: true do |t|
      t.integer  "roleplay_id"
      t.integer  "message_count"
      t.integer  "character_count"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "roleplay_metrics", ["roleplay_id"], name: "index_roleplay_metrics_on_roleplay_id", using: :btree

    create_table "roleplays", force: true do |t|
      t.string   "name"
      t.boolean  "public",            default: true
      t.boolean  "looking",           default: false
      t.integer  "user_id"
      t.integer  "campaign_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "last_character_id"
      t.integer  "post_count",        default: 0
      t.integer  "character_count",   default: 0
      t.integer  "permission_id",     default: 1
      t.integer  "character_id"
      t.json     "data",              default: {}
      t.boolean  "active",            default: true
    end

    add_index "roleplays", ["campaign_id"], name: "index_roleplays_on_campaign_id", using: :btree
    add_index "roleplays", ["character_id"], name: "index_roleplays_on_character_id", using: :btree
    add_index "roleplays", ["user_id"], name: "index_roleplays_on_user_id", using: :btree

    create_table "site_discussion_comments", force: true do |t|
      t.integer  "user_id"
      t.integer  "site_discussion_id"
      t.string   "name"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "site_discussion_comments", ["site_discussion_id"], name: "index_site_discussion_comments_on_site_discussion_id", using: :btree

    create_table "site_discussion_topics", force: true do |t|
      t.string  "name"
      t.integer "parent_id"
      t.integer "weight",    default: 0
    end

    create_table "site_discussions", force: true do |t|
      t.integer  "user_id"
      t.string   "name"
      t.text     "content"
      t.boolean  "pinned"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "last_user_id"
      t.integer  "post_count",   default: 0
      t.integer  "topic_id",     default: 1
      t.boolean  "active",       default: true
    end

    add_index "site_discussions", ["pinned", "updated_at"], name: "index_site_discussions_on_pinned_and_updated_at", using: :btree
    add_index "site_discussions", ["topic_id"], name: "index_site_discussions_on_topic_id", using: :btree

    create_table "systems", force: true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.boolean  "public"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.json     "data",       default: {}
    end

    create_table "titles", force: true do |t|
      t.string   "prefix"
      t.string   "suffix"
      t.string   "name"
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "user_accounts", id: false, force: true do |t|
      t.integer "user_id"
      t.string  "stripe_id"
      t.integer "storage_limit"
      t.integer "balance"
      t.integer "subscription_id"
      t.integer "subscription_days"
      t.integer "gem_preorder_id"
      t.integer "sub_preorder_id"
      t.string  "default_card_id"
    end

    add_index "user_accounts", ["subscription_id"], name: "index_user_accounts_on_subscription_id", using: :btree
    add_index "user_accounts", ["user_id"], name: "index_user_accounts_on_user_id", using: :btree

    create_table "user_email_settings", id: false, force: true do |t|
      t.integer "user_id"
      t.integer "setting_id"
      t.boolean "value"
    end

    create_table "user_metrics", id: false, force: true do |t|
      t.integer "user_id"
      t.integer "comment_count"
      t.integer "message_count"
      t.integer "campaign_count"
      t.integer "character_count"
    end

    add_index "user_metrics", ["user_id"], name: "index_user_metrics_on_user_id", using: :btree

    create_table "user_notification_counts", id: false, force: true do |t|
      t.integer  "user_id"
      t.integer  "roleplay",            default: 0
      t.integer  "message",             default: 0
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "campaign_discussion", default: 0
    end

    add_index "user_notification_counts", ["user_id"], name: "index_user_notification_counts_on_user_id", using: :btree

    create_table "user_social_logins", id: false, force: true do |t|
      t.integer  "user_id"
      t.string   "provider"
      t.string   "uid"
      t.text     "token"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "user_social_logins", ["uid", "provider"], name: "index_user_social_logins_on_uid_and_provider", using: :btree
    add_index "user_social_logins", ["user_id", "provider"], name: "index_user_social_logins_on_user_id_and_provider", using: :btree

    create_table "user_titles", id: false, force: true do |t|
      t.integer  "user_id"
      t.integer  "title_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "user_titles", ["title_id"], name: "index_user_titles_on_title_id", using: :btree
    add_index "user_titles", ["user_id"], name: "index_user_titles_on_user_id", using: :btree


    create_table "user_unread_items", id: false, force: true do |t|
      t.integer  "user_id"
      t.integer  "item_id"
      t.string   "item_type"
      t.integer  "unread_count"
      t.datetime "updated_at"
    end

    add_index "user_unread_items", ["user_id", "item_id"], name: "index_user_unread_items_on_user_id_and_item_id", using: :btree
    add_index "user_unread_items", ["user_id", "updated_at"], name: "index_user_unread_items_on_user_id_and_updated_at", using: :btree

    create_table "users", force: true do |t|
      t.string   "name"
      t.string   "email"
      t.string   "password_digest"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "login_token"
      t.datetime "login_token_expiration"
      t.integer  "image_id",               default: 0
      t.datetime "last_activity"
      t.boolean  "beta_access",            default: false
      t.boolean  "development_access",     default: false
      t.boolean  "sent_feedback_email",    default: false
      t.boolean  "pending_upload",         default: false
      t.integer  "title_id"
      t.boolean  "email_confirmed",        default: false
      t.integer  "organization_id"
      t.json     "data",                   default: {}
    end

    add_index "users", ["email"], name: "index_users_on_email", using: :btree
    add_index "users", ["last_activity"], name: "index_users_on_last_activity", using: :btree
    add_index "users", ["login_token"], name: "index_users_on_login_token", using: :btree

  end

end
