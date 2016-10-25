import React, {Component} from 'react';

class SearchResultsList extends Component {
  render(){
    return (
      <ul className="dropdown-menu" id="autocomplete-items">
        {this.renderAlbums()}
      </ul>
    );
  };

  buttonClick(){
    $.post({
      url: '/albums/new.json',
      type: "POST",
      data: { id: id },
      dataType: "json"
    });
  }

  renderAlbums(){
    let onClick = () => this.buttonClick();
    let addAlbum = <button className="button" onClick={onClick}>Add</button>
    if (this.props.albums === undefined) {
      return ''
    } else {
      let totalAlbums = this.props.albums.albums.total;
      let i = 0;
      return (
        <ul>
          <div className="dropdown-item"><a href={"/albums/" + this.props.albums.albums.items[0].id}><img src={this.props.albums.albums.items[0].images[2].url}/>
          {this.props.albums.albums.items[0].name}{addAlbum}</a></div>
          <div className="dropdown-item"><a href="/albums/new" id={this.props.albums.albums.items[0].id}><img src={this.props.albums.albums.items[1].images[2].url}/>
          {this.props.albums.albums.items[1].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new" id={this.props.albums.albums.items[0].id}><img src={this.props.albums.albums.items[2].images[2].url}/>
          {this.props.albums.albums.items[2].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new" id={this.props.albums.albums.items[0].id}><img src={this.props.albums.albums.items[3].images[2].url}/>
          {this.props.albums.albums.items[3].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new" id={this.props.albums.albums.items[0].id}><img src={this.props.albums.albums.items[4].images[2].url}/>
          {this.props.albums.albums.items[4].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new" id={this.props.albums.albums.items[0].id}><img src={this.props.albums.albums.items[5].images[2].url}/>
          {this.props.albums.albums.items[5].name}</a></div>
          <div className="dropdown-item"><a href="/albums/new" id={this.props.albums.albums.items[0].id}>Or add it yourself</a></div>
        </ul>
      );
    };
  };
}

export default SearchResultsList;
