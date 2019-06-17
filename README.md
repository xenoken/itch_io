
## Usage

A simple usage example:

```dart
import 'package:itch_io/itch_io.dart';

main() async{
  
  var client = new ItchIOClient("api_key_here");
  var user = await client.getUserProfile();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].


[tracker]: https://github.com/xenoken/itch_io/issues
