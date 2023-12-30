# riverpod_architecture

Example Architecture that uses Riverpod

This example shows how authentication is implemented.

1) Features are divided into slices
2) Each feature consists of Domain, Presentation and Handlers
3) Either Repository/Handler is initialized using Riverpod providers and passed around in the pages or components if needed
3) In the case of a page using multiple entities, handlers are used to get data from many models.
4) Handlers on the client side are just a single method, while on the server side trigger more than one method. 
5) Akin to clean architecture without some of the layers 



Problems

1) With something like BLoC you are forced into a design pattern, while with Riverpod you are free to choose your architecture. So this architecture uses Riverpod along side vertical slice. Riverpod providers act as controllers and dependency injections.
2) Why not clean architecture? Clean architecture uses layers like controllers and usecases. Controllers are not necessary because Riverpod providers perse act as controllers. While usecases are needed, we have handlers which abstracts away the repository pattern to the backend and calls the data that is only needed for the specific feature. This completely eliminates the need for usecases on the client side.
3) Using handlers and Riverpod providers as controllers we have completely eliminated the need for two layers and everything is much more developer friendly without the complexity that comes with Clean Architecture.
4) In case logic is needed in controllers, you can always inject logic into the providers
5) On the off chance some logic needs to be done on the client side like using local database, we have a service layer that can handle this. Using this you can create an abstract class and combine two models and use them on the same page or for the local database which is highly recommended.


git init
Core

1) While Flutter you can add styles to widgets in the widget perse, these are not a good idea. It is best to abstract away the style like CSS does in web dev. Core folder has a theme folder, which can be used to store as many themes as the developer wants and also any style. This follows DRY principle and does not allow unnecessary style code in every single page.
2) Router folder contains all the data for the router. This includes the observer to create the breadcrumb navigation in the other project, and shelled navigation, etc.
3) General Providers, this file contains the providers that are common throughout the application. Namely if you want to open the local database as soon as the app opens, or if you want to load the database from your endpoint, or Firebase. In this case I have included an example of Appwrite which works as long as you enter your endpoints and your id. Also make sure to change the routes using just push and pop for now to test it out.
4) Components folder here is just a folder that shares the same widgets across every single feature.


Future Challenges

1) This architecture can be used for complex application, however something to remember is it is not finished. The architecture needs to evolve alongside your project, this is not a one size fits all. For example, you can have another folder for localization and much more.
2) Some architectures online which also use Riverpod follow the same way, but uses another folder to store all the Riverpod Providers. I have put the Provider inside the same repository/handler because it is easily accessible, and also does not complicate things with more folders. I recommend doing it this way. While some might say the other method abstracts away the state management and you can just delete the providers file, the issue is you will have to regardless do a lot of refactoring no matter what state management you decide to use and switch to. So might as well just do it this way which eliminates many more unnecessary folders. This also makes it extremely easy to view from the developer's perspective.
