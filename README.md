# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| kana_first_name    | string              | null: false             |
| kana_last_name     | string              | null: false             |
| birthday           | integer             | null: false             |

### Association

* has_many :items
* has_many :comments

## items table

| Column             | Type          | Options           |
|--------------------|---------------|-------------------|
| title              | string        | null: false       |
| image              | ActiveStorage | null: false       |
| text               | text          | null: false       |
| category           | string        | null: false       |
| status             | string        | null: false       |
| shipping           | integer       | null: false       |
| prefecture         | string        | null: false       |
| days               | string        | null: false       |
| price              | integer       | null: false       |
| user               | references    | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| items       | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user