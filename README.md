<div id="top"></div>

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Contributors][contributors-shield]][contributors-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://https://bhouse-app.herokuapp.com/">
    <img src="https://res.cloudinary.com/dbegssigw/image/upload/v1653137729/bhouse_app/bhouselogosquare_g01lzk.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">BHouse App</h3>

  <p align="center">
    Lodging houses management system
    <br />
    <a href="https://github.com/quevon/BHouse"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://https://bhouse-app.herokuapp.com/">View Demo</a>
    ·
    <a href="https://github.com/quevon/BHouse/issues">Report Bug</a>
    ·
    <a href="https://github.com/quevon/BHouse/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

![Product Name Screen Shot][product-screenshot]

BHouse provides a platform for _renters_ looking for an easier way of finding a place suitable for their needs and budget and _business owners_ who want to advertise and manage their rentals.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

- [Ruby on Rails](https://rubyonrails.org/)
- [Stimulus-Rails](https://github.com/hotwired/stimulus-rails)

### Dependencies

`ruby 3.0.3`

`Rails 6.1.6`

<p align="right">(<a href="#top">back to top</a>)</p>

### User Stories

- Admin
  - Able to approve new Owners.
  - Able to create a new Tenant or Owner account.
  - Able to update Owner/Tenant profile information except for their password.
  - Able to view all properties.

- Owner
  - Able to create an account to post properties for rent.
  - Able to create own profile.
  - Able to upload own picture.
  - Able to post properties for rent.
  - Able to message tenants.
  - Able to comment to posts.
  - Able to view own properties.
  - Able to view tenant’s profile.
  - Able to approve or reject tenants.
  - Able to view my own tenants.

- Tenant
  - Able to create an account.
  - Able to create own profile.
  - Able to upload own picture.
  - Able to filter properties according to needs.
  - Able to message Owners.
  - Able to view properties listed by an Owner.
  - Able to apply as tenants to properties.

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running, do the following:

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/quevon/BHouse.git
   ```

2. Install bundle packages
   ```sh
   bundle install
   ```
3. Install yarn packages
   ```sh
   yarn install
   ```
4. Migrate the database
   ```sh
   rails db:migrate
   ```

### Using your own API Keys

1. Register for a free API Key

- Cloudinary
  [https://cloudinary.com/documentation/image_upload_api_reference](https://cloudinary.com/documentation/image_upload_api_reference)
- Google Places
  [https://developers.google.com/maps/documentation/places/web-service/overview](https://developers.google.com/maps/documentation/places/web-service/overview)

2. Create a `.env` file in the root directory
   ```rb
    CLOUD_NAME=YOUR_CLOUDINARY_API_NAME
    CLOUD_API_KEY=YOUR_CLOUDINARY_API_KEY
    CLOUD_API_SECRET=YOUR_CLOUDINARY_API_SECRET
    PLACES_API_KEY=YOUR_GOOGLEPLACES_API_KEY
   ```

<p align="right">(<a href="#top">back to top</a>)</p>
 
<!-- USAGE EXAMPLES -->

## Usage

1. ` Sign up / Login / Active Admin`

2. ` Properties`

3. ` Messages`
<p>Users can send messages to another user</p>

```rb
receipt = current_user.send_message(recipient, params[:body], recipient.name)
```

<p>And the user can also reply to any messages received</p>

```rb
@conversation = current_user.mailbox.conversations.find(params[:id])

receipt = current_user.reply_to_conversation(@conversation, params[:body])
```

4. ` Transactions`

### Flow Chart

_Insert flow chart here_

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] one
- [x] two
- [ ] three
  - [ ] 4
  - [ ] 5
  - [ ] 6

See the [open issues](https://github.com/quevon/Bhouse/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Project Link: [https://github.com/quevon/Bhouse](https://github.com/quevon/Bhouse)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

<p align="right">(<a href="#top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/quevon/Bhouse.svg?style=for-the-badge
[contributors-url]: https://github.com/quevon/Bhouse/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/quevon/Bhouse.svg?style=for-the-badge
[forks-url]: https://github.com/quevon/Bhouse/network/members
[stars-shield]: https://img.shields.io/github/stars/quevon/Bhouse.svg?style=for-the-badge
[stars-url]: https://github.com/quevon/Bhouse/stargazers
[issues-shield]: https://img.shields.io/github/issues/quevon/Bhouse.svg?style=for-the-badge
[issues-url]: https://github.com/quevon/Bhouse/issues
[product-screenshot]: https://res.cloudinary.com/dbegssigw/image/upload/v1653138215/bhouse_app/Screen_Shot_2022-05-21_at_9.03.19_PM_dz9ua7.png
