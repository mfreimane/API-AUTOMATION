require_relative 'features/support/api_helper'
require 'json'

thumbnail = { 'url' => 'https://pbs.twimg.com/profile_images/662215297378574336/YOOD0ijr_400x400.png'}

fields = []

fields.push({'name' => 'Autors', 'value' => 'Madara'})
fields.push({'name' => 'Merķis', 'value' => 'kurss'})
embed = []
embed.push('title' => 'Test title',
           'colour' => 16007746,
           'thumbnail' => thumbnail,
           'fields' => fields)
payload = {
    'content' => 'Madara Freimane',
    'embeds' => embed
}.to_json

API.post('https://discordapp.com/api/webhooks/459005793627406359/-6FGK6la-XlTO_UZ2G62Cx-TZ0AwmMqIPd3rBkusV1nwPQo1RlmhAp3Kaxn_gHS85Aqs',
                             headers: {'Content-Type' => 'application/json'},
                             cookies: {},
                             payload: payload)