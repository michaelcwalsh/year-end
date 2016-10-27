import React, {Component} from 'react';

class SearchResultsList extends Component {
  render(){
    return (
      <ul className="dropdown-menu" id="autocomplete-items">
        {this.renderAlbums()}
      </ul>
    );
  };

  renderAlbums(){
    if (this.props.albums === undefined) {
      return ''
    } else {
      return (
        <ul>
          {this.props.albums.albums.items.map(function(album) {
            return (
              <div className="dropdown-item"><a href={"/albums/" + album.id}><img className="circle" src={album.images[2].url}/>
              {album.name}</a></div>
            );
          })}
          <div className="dropdown-item"><a href="/albums/new">Or add it yourself</a></div>
        </ul>
      );
    };
  };
}

export default SearchResultsList;
