import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product.dart';
import 'package:shopp/providers/product_provider.dart';
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
     
     if(
     ( _imagecontroller.text.startsWith('http')&& _imagecontroller.text.startsWith('https'))
     || (_imagecontroller.text.endsWith('.png')&& _imagecontroller.text.endsWith('.jpg')
     && _imagecontroller.text.endsWith('.jpeg'))){
      return ;
     }
     setState(() {
       
     });
    }
  }
  void _saveform(){
    final isvalid = _form.currentState!.validate();
    if(!isvalid){
      return null ;
    }
    _form.currentState!.save();
    Provider.of<Products>(context,listen: false).addProducts(_editedproduct);
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
           validator:(value){
            if(value!.isEmpty){
              return 'Please provide a value';
            }
            return null ;
           },
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
           validator: (value){
            if(value!.isEmpty){
              return 'Please provide a value';
            }
            if(double.tryParse(value) == null){
              return 'please enter a valid number';
            }
            if(double.parse(value) <= 0 ){
              return 'Please enter a value more than zero';
            }
            return null ;
           },
           onFieldSubmitted: (_)=>FocusScope.of(context).requestFocus(_descriptionfocusnode),),
            TextFormField(decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
           textInputAction: TextInputAction.next ,
           keyboardType: TextInputType.multiline,
           validator: (value){
             if(value!.isEmpty){
              return 'Please enter a valid input';
             }
             if(value.length < 10){
              return 'Should be at least 10 charachters';
             }
             return null ;
           },
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
              child: TextFormField(onEditingComplete: (){
                setState(() {
                  
                });
              },controller:_imagecontroller,decoration: InputDecoration(labelText: 'Imageurl')
              ,keyboardType: TextInputType.url,textInputAction:TextInputAction.done,
              validator: (value){
              
          
   } ),

            ),
          
           ],)

      ],
      ),
      ),
    ),
    );
  }
}