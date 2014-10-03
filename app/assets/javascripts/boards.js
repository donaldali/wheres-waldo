var boards = (function( $ ) {

  var relativeX, relativeY;

  var InstructionListener = function() {
    $( '.instruction' ).find( 'img' ).on( 'click', function() {
      $( '.instruction' ).hide();
    });
  };

  var messageListener = function() {
    $( '.message' ).on( 'click', function() {
      $( '.message' ).fadeOut( 'fast' );
    });
  };

  var showMessage = function( msg ) {
    var msgPosition = $( '.options' ).position();
    $( '.options' ).hide();
    $( '.message' ).find( 'span' ).html( msg );
    $( '.message' ).css( 'left', msgPosition.left + 'px' ).
                    css( 'top',  (msgPosition.top + 30)  + 'px' ).
                    fadeIn( 'fast' );
  };

  var optionsListener = function() {
    $( '.options' ).find( 'button' ).on( 'click', function() {

      // Make Ajax call
      $.get( '/check_character.json', {
        id: window.location.href.split("/").pop(),
        character: $( this ).val(),
        x: relativeX,
        y: relativeY
      }).done( handleResponse )
        .fail( function( jqxhr, textStatus, error ) {
          var err = textStatus + ", " + error;
          console.log( "Ajax Request Failed: " + err );
      });

    });
  };

  var handleResponse = function( data ) {
    if( data ) {
      coverCharacter( data.x, data.y, data.width, data.height );
      removeCharacter( data.name );
      showMessage( 'You Got It' );
    } else {
      showMessage( 'Try Again' );
    }
  };

  var coverCharacter = function( x, y, width, height ) {
    var $cover = $( '<div>' ).addClass( 'found' ).
                              width( width ).height( height ).
                              css( 'left', x + 'px' ).
                              css( 'top',  y + 'px' ).
                              appendTo( $( '.main-image' ) );
  };

  var removeCharacter = function( character ) {
    $( '.' + character ).hide();
  };

  var showOptions = function( x, y, clientX, clientY ) {
    var $options = $( '.options' );

    // Make adjustment if some of options box will appear off-screen
    if ( clientX + $options.outerWidth() >= $( window ).width() ) {
      $options.css( 'left', ( x - $options.outerWidth() ) + 'px' );
    } else {
      $( '.options' ).css( 'left', x + 'px' );
    }

    if ( clientY + $options.outerHeight() >= $( window ).height() ) {
      $options.css( 'top', ( y - $options.outerHeight() ) + 'px' );
    } else {
      $( '.options' ).css( 'top', y + 'px' );
    }

    $( '.options' ).fadeIn( 'fast' );
  };

  var imageListener = function() {
    $( '.main-image' ).find( 'img' ).on( 'click', function( event ) {
      var parentOffset = $(this).offset(); 
      relativeX = event.pageX - parentOffset.left;
      relativeY = event.pageY - parentOffset.top;

      imageHandler( relativeX, relativeY, event.clientX, event.clientY )
    });
  };

  var imageHandler = function( relX, relY, clientX, clientY ) {
    if( $( '.options' ).is( ':visible' ) ) {
      $( '.options' ).fadeOut( 'fast' );
    } else if( $( '.message' ).is( ':visible' ) ) {
      $( '.message' ).fadeOut( 'fast' );
    } else {
      showOptions( relX, relY, clientX, clientY );
    }

  };

  var clearPopups = function() {
    $( document ).mouseup( function ( event ) {
      var $container = $( '.main-image' );
      // if the target of the click isn't the container...
      if ( !$container.is( event.target ) &&
          // ... nor a descendant of the container
          $container.has( event.target ).length === 0 ) { 
        $( '.options' ).fadeOut( 'fast' );
        $( '.message' ).fadeOut( 'fast' );
      }
    });
  };

  var setupListeners = function() {
    if( $('.boards.show' ).length ) {
      InstructionListener();
      messageListener();
      optionsListener();
      imageListener();
      clearPopups();
    }
  };

  return {
    setupListeners: setupListeners
  };
})( jQuery );

$( boards.setupListeners );
