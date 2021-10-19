import React, { Component } from 'react';
import Identicon from 'identicon.js';
import photo from '../house-logo.png'

class Navbar extends Component {

  render() {
    return (
      <React.Fragment>
     
      <nav className="navbar navbar-dark bg-primary   flex-md-nowrap p-0 shadow">
        <a
          className="navbar-brand col-sm-3 col-md-2 mr-0"
          href="#"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={photo} width="30" height="30" className="d-inline-block  align-top" alt="" /> &nbsp; 
            Property Listing
        </a>
        <ul className="navbar-nav px-3">
          <li className="nav-item text-nowrap d-none d-sm-none d-sm-block">
            <small className="text-primary">
              <small id="account">{this.props.account}</small>
            </small>
            { this.props.account
              ? <img
                className='ml-2'
                width='30'
                height='30'
                src={`data:image/png;base64,${new Identicon(this.props.account, 30).toString()}`}
              />
              : <span></span>
            }
          </li>
        </ul>
      </nav>
      <div style={{ height: '15px' }} className="container-fluid bg-danger m-0 p-0 "></div>
      </React.Fragment>
    );
  }
}

export default Navbar;