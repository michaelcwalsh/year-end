import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import SearchController from './components/SearchController';
import SearchBar from './components/SearchBar';
import SearchResultsList from './components/SearchResultsList';

$(function() {
  ReactDOM.render(
    <SearchController />,
    document.getElementById('search')
  );
});
