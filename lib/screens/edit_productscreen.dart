import 'package:flutter/material.dart';
import 'package:shopp/providers/product.dart';
class Editproductscreen extends StatefulWidget {
  static const routname = '/edit-productscreen';
  const Editproductscreen({ Key? key }) : super(key: key);

  @override
  State<Editproductscreen> createState() => _EditproductscreenState();
}

class _EditproductscreenState extends State<Editproductscreen> {
  final _pricenode = FocusNode();
  final _descriptionfocusnode = FocusNode();
  final _imagecontroller = TextEditingController();
  final _imagefocusnode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedproduct = Product(id: '',
  description: '',
   imgurl: '', 
   price: 0, 
   title: '');


@override
  void initState() {
    // TODO: implement initState
    _imagefocusnode.addListener( _updateimageurl);
    super.initState();
  }
  void _updateimageurl(){
    if(!_imagefocusnode.hasFocus){
      setState(() {
        
      });
    }
  }
  void _saveform(){
    _form.currentState!.save();
    print(_editedproduct.description);
    print(_editedproduct.id);
    print(_editedproduct.imgurl);
    print(_editedproduct.price);
    print(_editedproduct.title);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _imagefocusnode.removeListener(_updateimageurl);
    _pricenode.dispose();
    _descriptionfocusnode.dispose();
    _imagecontroller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(onPressed: (_saveform), icon: Icon(Icons.save),
        )
      ],title: Text('Edit your products'),
    ),body: Padding(
      padding: EdgeInsets.all(6.0),
      child: Form(key: _form,child:ListView(children: <Widget>[
            TextFormField(decoration: InputDecoration(labelText: 'Title'),
           textInputAction: TextInputAction.next,focusNode: _pricenode,
           onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_pricenode), 
           onSaved: (value){
            _editedproduct = Product(id: _editedproduct.id, description: _editedproduct.description, 
            imgurl: _editedproduct.imgurl, 
            price: _editedproduct.price, 
            title: _editedproduct.title);
           },
           ),
             TextFormField(decoration: InputDecoration(labelText: 'Price'),
           textInputAction: TextInputAction.next ,
           keyboardType: TextInputType.number,focusNode: _pricenode,
           onFieldSubmitted: (_)=>FocusScope.of(context).requestFocus(_descriptionfocusnode),),
            TextFormField(decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
           textInputAction: TextInputAction.next ,
           keyboardType: TextInputType.multiline,
           focusNode: _descriptionfocusnode,
           ),
           Row(children: <Widget>[
            Container(height: 100,width: 100,margin: EdgeInsets.only(top: 8,right: 10,),
            decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),
            ),
            child: _imagecontroller.text.isEmpty ? Text('Enter url'):
            FittedBox(child:Image.network(_imagecontroller.text)
            ,fit: BoxFit.cover,),
            
            ),
            Expanded(
              child: TextFormField(decoration: InputDecoration(labelText: 'Imageurl')
              ,keyboardType: TextInputType.url,textInputAction:TextInputAction.done
              ,focusNode:_imagefocusnode,onFieldSubmitted: (_){
                _saveform();
              },),

            ),
          
           ],)

      ],
      ),
      ),
    ),
    );
  }
}