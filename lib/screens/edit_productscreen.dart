import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product.dart';
import 'package:shopp/providers/product_provider.dart';
class Editproductscreen extends StatefulWidget {
  static const routname = '/edit-productscreen';
  

  @override
  State<Editproductscreen> createState() => _EditproductscreenState();
}

class _EditproductscreenState extends State<Editproductscreen> {
  
  final _pricenode = FocusNode();
  final _descriptionfocusnode = FocusNode();
  final _imagecontroller = TextEditingController();
  final _titlecontroller = TextEditingController();
  final _pricecontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  final _imagefocusnode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _isInit = true ;
  var _initvalues = {
 'title' : '',
 'Description' : '',
  'price':0,
  'id' : null,
  'imageurl':'',


  };
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

  @override
  void didChangeDependencies() {
    if(!_isInit){
   final prodid  = ModalRoute.of(context)?.settings.arguments  as String ;
   if(prodid != null){
    _editedproduct =  Provider.of<Products>(context,listen: false).findbyId(prodid); 
    _initvalues = {
'title' : _editedproduct.title,
 'Description' : _editedproduct.description,
  'price':_editedproduct.price.toString(),
 
  'imageurl':_editedproduct.imgurl,

  };
  _descriptioncontroller.text = _editedproduct.description;
  _titlecontroller.text = _editedproduct.title;
  _pricecontroller.text = _editedproduct.price.toString();
  _imagecontroller.text = _editedproduct.imgurl;
   }
  

  
 
    }
    _isInit = false ;
    
    super.didChangeDependencies();
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
    print(isvalid);
    _form.currentState!.save();
    
    if(_editedproduct.id!= null){
      print ('data is null');
      Provider.of<Products>(context,listen: false).updateProducts(_editedproduct.id, _editedproduct);
    }
    print('not adding');
    Provider.of<Products>(context,listen: false).addProducts(_editedproduct);
    Navigator.of(context).pop();
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
            TextFormField(
            // initialValue: _initvalues['title'].toString(),
              decoration: InputDecoration(labelText: 'Title'),
           textInputAction: TextInputAction.next,
           controller: _titlecontroller,
           validator:(value){
            if(value!.isEmpty){
              return 'Please provide a value';
            }
            return null ;
           },
           onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_pricenode), 
           onSaved: (value){
            _editedproduct = Product(id: _editedproduct.id, description: _editedproduct.description, 
            imgurl: _editedproduct.imgurl.toString(), 
            price: _editedproduct.price, 
            title: value!,
            isFav: _editedproduct.isFav);
           },
           ),
             TextFormField(decoration: InputDecoration(labelText: 'Price'),
             // initialValue: _initvalues['price'].toString(),
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
            onSaved: (value){
            _editedproduct = Product(id: _editedproduct.id, description: _editedproduct.description, 
            imgurl: _editedproduct.imgurl.toString(), 
            price: double.parse(value!), 
            title: _editedproduct.title,
            isFav: _editedproduct.isFav);
           },
           onFieldSubmitted: (_)=>FocusScope.of(context).requestFocus(_descriptionfocusnode),),
            TextFormField( 
              controller: _descriptioncontroller,
            //  initialValue: _initvalues['Description'].toString(),
             onSaved: (value){
            _editedproduct = Product(id: _editedproduct.id, description: value!, 
            imgurl: _editedproduct.imgurl.toString(), 
            price: _editedproduct.price, 
            title: _editedproduct.title,
            isFav: _editedproduct.isFav);
           },
            decoration: InputDecoration(labelText: 'Description'),
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
              child: TextFormField( onEditingComplete: (){
                setState(() {
                  
                });
              },decoration: InputDecoration(labelText: 'Imageurl'),
             // initialValue: _initvalues['imageurl'].toString(),
             controller: _imagecontroller,
              keyboardType: TextInputType.url,textInputAction:TextInputAction.done,
               onSaved: (value){
            _editedproduct = Product(id: _editedproduct.id, description: _editedproduct.description, 
            imgurl: value!, 
            price: _editedproduct.price, 
            title: _editedproduct.title,
            isFav: _editedproduct.isFav);
           },
              validator: (value){
             if(value!.isEmpty){
              return 'Please provide a valid value';
             }
          /* if(!value.startsWith('http')&& !value.startsWith('https')){
            return 'Please enter a valid Url';
           } */
     return null ;
          
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
