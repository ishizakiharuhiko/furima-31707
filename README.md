# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| kana_first_name    | string              | null: false             |
| kana_last_name     | string              | null: false             |
| birthday           | date                | null: false             |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items table

| Column             | Type          | Options           |
|--------------------|---------------|-------------------|
| title              | string        | null: false       |
| text               | text          | null: false       |
| category_id        | integer       | null: false       |
| status_id          | integer       | null: false       |
| shipping_id        | integer       | null: false       |
| prefecture_id      | integer       | null: false       |
| day_id             | integer       | null: false       |
| price              | integer       | null: false       |
| user               | references    | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| item            | references | foreign_key: true |
| user            | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| postal_number     | string     | null: false       |
| prefecture_id     | integer    | null: false       |
| city              | string     | null: false       |
| street            | string     | null: false       |
| building_name     | string     |                   |
| telephone_number  | string     | null: false       |
| order             | references | foreign_key: true |

### Association

- belongs_to :order