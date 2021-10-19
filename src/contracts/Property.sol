pragma solidity ^0.5.0;

contract Property {
  // Code goes here...
  string public name = "Property listing";

  // store images
  mapping(uint => Image) public images;
  uint public imageCount = 0;

  struct Image {
    uint id;
    string hash;
    string description;
    uint tipAmount;
    address payable author;
  }

  event imageCreated (
    uint id,
    string hash,
    string description,
    uint tipAmount,
    address payable author
  );

  event imageTipped (
    uint id,
    string hash,
    string description,
    uint tipAmount,
    address payable author
  );


  // create images
  function uploadImage(string memory _imgHash, string memory _description) public {
    // ensure there is an image
    require(bytes(_imgHash).length > 0);
    // ensure description exists
    require(bytes(_description).length > 0);
    // ensure uploader address exists
    require(msg.sender != address(0x0));
   // increment image id
    imageCount ++;
    // add image
      images[imageCount] = Image(imageCount, _imgHash, _description, 0, msg.sender);

      //emit event
      emit imageCreated(imageCount, _imgHash, _description, 0, msg.sender);
  }

  // tip images
  function tipImageOwner(uint id) public payable {

    require(id > 0 && id <= imageCount);

    Image memory _image = images[id];

    address payable _author = _image.author;
    //tip the author
    address(_author).transfer(msg.value);
    //increment the tip amount
    _image.tipAmount = _image.tipAmount + msg.value;
    //update the image
    images[id] = _image;  

     //emit event
      emit imageTipped(imageCount, _image.hash, _image.description, _image.tipAmount, _author);


  }
  
}