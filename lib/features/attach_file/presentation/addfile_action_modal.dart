
 // * Request Modal AddFile Action
// * @Author: Varthinee Teangthong 
// * @Create Date: 2563-08-03


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:onlinerequestsystem/features/attach_file/presentation/show_file/show_file_widget.dart';

class ModalAddFileAction extends StatelessWidget {
  final ScrollController scrollController;

  const ModalAddFileAction({Key key, this.scrollController}) : super(key: key);
  @override
  build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Photo'),
            leading: Icon(Icons.camera_enhance),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => ShowFile(),
              );
              Navigator.of(context).push(materialPageRoute);
            },
          ),
          ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.collections),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => ShowFile(),
                );
                Navigator.of(context).push(materialPageRoute);
              }),
          ListTile(
            title: Text('Directory'),
            leading: Icon(Icons.create_new_folder),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => ShowFile(),
              );
              Navigator.of(context).push(materialPageRoute);
            },
          ),
        
        ],
      ),
    ));
  }
}
