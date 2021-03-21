A template for writing and hosting personal websites directly from github pages.

### Using the template
Create a new repository using the `use this template button`, the repository name should be `johndoe.github.io` (where johndoe is your own user name). Congratulation, your site is now up and running at the adress johndoe.github.io.

### Editing the template
- Edit the variables in `-config.yml` to add your name, email address, CV, picture and social media accounts
- Edit the `index.markdown` to write you hompage
- Add pages in the `/pages` folder following the example of the `hello page`. The content can be written completely in [markdown](https://www.markdownguide.org/cheat-sheet/)

If you want to link the new pages that you have created from the main menu of the website, you have to add them manually into the `_config.yml` file, the same way the `hello` page is linked there. For example, if you want to add a page stored in the file `examplepage.md` in the folder `pages`, the file `_config.yml` should look like.
```
header_pages:
  - pages/hello.md
  - pages/examplepage.md
```
I chose to add the files manually here instead of simply taking all of them to allow to have pages not linked in the main menu, but accessible via hyperlinks from other pages.


### Aspect
You can see a dummy website based on this template [here](https://thibautbenjamin.github.io/site_template/)

### Credit
This code is heavily adapted from the [minima](https://github.com/jekyll/minima) jekyll theme. I modified some aspects to my own taste and designed a homepage that I found better suited for a personal website.
