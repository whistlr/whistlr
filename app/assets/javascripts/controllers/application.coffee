Whistlr.ApplicationController = Em.Controller.extend
  resetSearchBar: (->
    Whistlr.searchBar().set "searchQuery", ""
  ).observes("currentPath")