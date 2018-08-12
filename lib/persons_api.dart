library persons_api;

import 'package:rpc/rpc.dart';
import 'package:persons_answers/person_model.dart';
import 'package:persons_answers/person_response.dart';

@ApiClass(
  name: 'p',
  version: 'v1'
)
class PersonsApi {
  PersonsApi();

  @ApiResource()
  PersonResource resource = PersonResource();

  @ApiMethod(path: 'status')
  PersonResponse test() {
    return PersonResponse()..result = 'Up and running...';
  }
}

class PersonResource {
  List<Person> _persons = [];

  @ApiMethod(path: 'persons')
  List<Person> getpersons() => _persons;

  @ApiMethod(path: 'person', method: 'POST')
  Person postperson(Person person) {
    _persons.add(person);
    return person;
  }
}
