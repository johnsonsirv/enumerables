<h1 align="center">Ruby Enumerable Methods</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/johnsonsirv/enumerables#readme" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/johnsonsirv/enumerables/graphs/commit-activity" target="_blank">
    <img alt="Maintenance" src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" />
  </a>
  <a href="https://github.com/johnsonsirv/enumerables/blob/master/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/github/license/johnsonsirv/enumerables" />
  </a>
  <a href="https://twitter.com/vokeugo" target="_blank">
    <img alt="Twitter: vokeugo" src="https://img.shields.io/twitter/follow/vokeugo.svg?style=social" />
  </a>
</p>

<p>
The Enumerable module that gets mixed into the Array and Hash classes (among others) provides you with lots of handy iterator methods.
In this project I re-built some of those methods to demonstrate their internal workings. The implementation covers basic operations
of these iterators, and does not take into account certain complexities. TDD approach was adopted. and tests where written using Rspec framework.

See [Documentation](https://ruby-doc.org/core-2.5.1/Enumerable.html) for complete details on Ruby Enumerables.

This project was completed in line with standards provided by [Microverse](https://www.microverse.org/ "The Global School for Remote Software Developers!").
</p>

## Methods (iterators):
The custom methods covered in this project include:
- #my_each
- #my_each_with_index
- #my_select
- #my_all?
- #my_any?
- #my_none?
- #my_count
- #my_map
- #my_inject
>  Note: #my_inject is a partial implementation as it does not take into account certain complexities.

## Built with:
- Ruby 2.4.0
- Rspec
- TDD

## Installation:
> Clone the repository to your local machine
```sh
$ git clone https://github.com/johnsonsirv/enumerables.git
```

### Usage
See some examples on how to use the methods

> navigate ```cd ``` into the cloned directory

```sh
$ cd enumerable
```
> load the module ```enumerable ``` 

```sh
 require "[RELATIVE_PATH]/enumerable"
```
```sh
arr = [2,3,4,5].my_each {|val| puts "#{val} apples!"}

# => 2 apples!
# => 3 apples!
# => 4 apples!
# => 5 apples!

puts (1..10).my_count {|num| num % 2 == 0}

# => 5
```

### Contributor(s):

[Victor Okeugo](https://angel.co/u/victorokeugo/)

- Github: [@johnsonsirv](https://github.com/johnsonsirv)
- Twitter: [@vokeugo](https://twitter.com/@vokeugo/)
- Email: [okeugo.victor.c@gmail.com]()

## How to contribute:
1. Fork it (https://github.com/johnsonsirv/enumerables/fork)
2. Create your feature (dev) branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -m 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request
> You can also create [issues](https://github.com/johnsonsirv/enumerables/issues)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE.md) file for details
