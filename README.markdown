# rwhtml

**A markdown-to-HTML converter that takes the RW WordPress peculiarities into
account.**

## Usage

`rwhtml` is a Ruby script that uses the [Redcarpet][] Markdown parser. You’ll
need to install that first:

    $ gem install redcarpet

You might need to `sudo` if you’re using the system-provided `ruby`.

And that’s it! The `rwhtml` ruby script takes input from `stdin` or accpts a
filename parameter, and outputs to `stdout` like your standard Unix utility.

    $ ruby rwhtml.rb < my-tutorial.markdown > my-tutorial.html

    $ ruby rwhtml.rb my-other-tutorial.markdown > my-other-tutorial.html

You can then inspect the output HTML and copy & paste it into the WordPress
editor. Or if you’re feeling lucky:

    $ ruby rwhtml.rb my-tutorial.markdown | pbcopy

There’s a macOS command line trick for you: `pbcopy` will put the text right
into the pasteboard, ready to be pasted.

## Limitations

Remember, the conversion only goes one way. Once your tutorial is in WordPress
you should edit it there! I used this script (or one like it) to get me 90%
of the way to a final WordPress post.

You’ll need to upload images and screenshots to WordPress yourself, and insert
the WP image tags as usual. This script will place `[[TODO image]]` tags with
the image URL and title from the Markdown.

## Contributing

Feedback and pull requests are welcome!

## License

Copyright © 2016 Greg Heo.

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.

[Redcarpet]: https://github.com/vmg/redcarpet

