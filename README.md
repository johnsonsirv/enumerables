# Ruby Enumerable Methods
The Enumerable module that gets mixed into the Array and Hash classes (among others) provides you with lots of handy iterator methods.
In this project I re-built some of those methods to demonstrate their internal workings. The implementation covers basic operations
of these iterators, and does not take into account certain complexities
See [Documentation](https://ruby-doc.org/core-2.5.1/Enumerable.html) for complete details on Ruby Enumerables.

This project was completed in line with standards provided by [Microverse](https://www.microverse.org/ "The Global School for Remote Software Developers!").

# Technologies
- Ruby
- Rspec
- TDD

# Methods (iterators)
The methods covered in this project include:
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

# Getting Started
> Clone the repository to your local machine
```sh
$ git clone https://github.com/johnsonsirv/enumerables.git
```
> navigate ```cd ``` into the cloned directory

```sh
$ cd enumerable
```
> load the module ```enumerable ``` 

```sh
 require "[RELATIVE_PATH]/enumerable"
```
> See some examples of how to use the methods
```sh
arr = [2,3,4,5].my_each {|val| puts "#{val} apples!"}

# => 2 apples!
# => 3 apples!
# => 4 apples!
# => 5 apples!

puts (1..10).my_count {|num| num % 2 == 0}

# => 5
```

# Contributors
This is solo project completed by [Victor Johnson](https://github.com/johnsonsirv/)

# How to contribute
1. Fork it (https://github.com/johnsonsirv/enumerables/fork)
2. Create your feature (dev) branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -m 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request
> You can also create [issues](https://github.com/johnsonsirv/enumerables/issues)

# License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE.md) file for details