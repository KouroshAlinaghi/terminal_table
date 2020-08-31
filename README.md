# terminal_table

TODO: Write a description here

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     terminal_table:
       github: your-github-user/terminal_table
   ```

2. Run `shards install`

## Usage

0. add `require "terminal_table"` to your file
1. You need an Array of Array of Int32 Or String (`Array(Array(Int32 | String))`) as rows. 
2. Create an instance of `TerminalTable::Table` with calling `TerminalTable::Table.new()`. Here are the supported arguments: 
| Key | Type | Default Value | Required? |
| --- | ---- | ------------- | --------- |
| rows | `Array(Array(Int32 \| String))` | _ | Yes |
| enable_separator | `Bool` | `true` | No |
| header | `Array(String) \| Nil` | `nil` | No |
| corner_char | `String` | "+" | No |
| row_char | `String` | "-" | No |
| col_char | `String` | "|" | No |

Example:
```crystal
h = ["Name", "Age"]
r = [
  ["Kourosh", 17],
  ["Dan", 32]
]

table = TerminalTable::Table.new(rows: r, header: h)
```
3. Print the table with the `TerminalTable::Table#to_s` methods! (returns a `String`)
  `puts table.to_s`

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/terminal_table/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [KouroshAlinaghi](https://github.com/your-github-user) - creator and maintainer
