// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:defaultapp/constants/constant.dart';

Future<DeployedContract> loadContract() async {
  String Abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = contractAddress1;
  ; //Deployed Contract address
  final contract = DeployedContract(ContractAbi.fromJson(Abi, "Dating App"),
      EthereumAddress.fromHex(contractAddress));
  print("Deployed Contract");
  print(contract.address);
  return contract;
}

Future<String> callFunction(String funname, List<dynamic> args,
    Web3Client ethClient, String privatekey) async {
  EthPrivateKey creds = EthPrivateKey.fromHex(privatekey);

  DeployedContract contract = await loadContract();

  final ethfunction = contract.function(funname);

  // print(contract);
  // print(ethfunction);
  final List<dynamic> result = await ethClient.call(
    sender: creds.address,
    contract: contract,
    function: ethfunction,
    params: args,
  );
  if (result.isNotEmpty) {
    // Decode the result based on the expected return type of your function
    String returnValue =
        result[0] as String; // Assuming the result is a single string

    print("Function return value: $returnValue");

    return returnValue;
  } else {
    // Handle the case where the result list is empty
    print("No elements found in the result list.");
    return ''; // or throw an appropriate exception
  }
}

Future<String> create(Web3Client ethClient) async {
  EthereumAddress address = EthereumAddress.fromHex(contractAddress1);

  var response =
      await callFunction('userProfiles', [address], ethClient, userprivatekey);

  return response;
}

Future<String> pdisplay(Web3Client ethClient) async {
  EthereumAddress address =
      EthereumAddress.fromHex('0xf7fD002DE8f87CcC4fDC5A04dA87d0247De48e4C');

  //EthPrivateKey creds = EthPrivateKey.fromHex(userprivatekey);
  // BigInt gasPrice = BigInt.from(20000000000); // Set a reasonable gas price
  // BigInt maxGas = BigInt.from(200000); // Set a reasonable gas limit

  var response =
      await callFunction('getUsername', [address], ethClient, userprivatekey);
  return response;
}

Future<void> display(Web3Client ethClient) async {
  EthereumAddress address =
      EthereumAddress.fromHex("0xf7fD002DE8f87CcC4fDC5A04dA87d0247De48e4C");

  //EthPrivateKey creds = EthPrivateKey.fromHex(userprivatekey);

  // BigInt gasPrice = BigInt.from(20000000000); // Set a reasonable gas price
  // BigInt maxGas = BigInt.from(200000); // Set a reasonable gas limit

  // var response = await callFunction(
  //   'createProfile',
  //   ["Aman" ,"1", "M"],
  //   ethClient,
  //   userprivatekey,
  // );
  BigInt bigIntValue = BigInt.parse("206");
  await callFunction(
    'updateProfile',
    ["", bigIntValue, "M"],
    ethClient,
    userprivatekey,
  );

  //return response;
}

idisplay(Web3Client ethClient) async {
  EthPrivateKey creds = EthPrivateKey.fromHex(userprivatekey);
  var response =
      await callFunction('Display', [creds.address], ethClient, userprivatekey);
  return response;
}

// final result = await ethClient.sendTransaction(
//     creds,
//     Transaction.callContract(
//       contract: contract,
//       function: ethfunction,
//       parameters: args,
//       maxGas: 23000,
//     ),
//     chainId: 80001, //80001
//     // 80001
//   );