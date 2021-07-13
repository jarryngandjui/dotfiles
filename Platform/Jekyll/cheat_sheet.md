# Jekyll for Blogging
[Github - pixyll](https://github.com/johno/pixyll)


### Formatting
**Code syntax with the blog**  

There are two types of code highlighting possible with Jekyll. First is the the "```" syntax native to markdown. The other is the "highlight" which is Jekyll template.

Left align
```ruby
```

Adds a tab to the code
```
{% highlight ruby lineanchors %}
{% endhighlight %}
```


**md-html support**
Jekyll support html tags with markdown documents. Useful for rendering images or content that requires custom formatting (i.e. images).

**color text**
Wrap a text with a span tag to give it color.
<span class="green">green</span> 

**line break**
use the html <br/> tag to add a line break

**blockquote**
<blockquote>
  <p>
    Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.
  </p>
  <footer><cite title="Antoine de Saint-Exupéry">Antoine de Saint-Exupéry</cite></footer>
</blockquote>
