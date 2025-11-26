import 'dart:io';
import 'package:json_annotation/json_annotation.dart';


class RegisterInputModel {
	String? type;
	@JsonKey(name: 'full_name') 
	String? fullName;
	File? img;
	String? phone;
	String? password;
	@JsonKey(name: 'date_of_birth') 
	String? dateOfBirth;
	String? gender;
	@JsonKey(name: 'curriculum_id') 
	String? curriculumId;
	@JsonKey(name: 'stage_id') 
	String? stageId;

	RegisterInputModel({
		this.type, 
		this.fullName, 
		this.img, 
		this.phone, 
		this.password, 
		this.dateOfBirth, 
		this.gender, 
		this.curriculumId, 
		this.stageId, 
	});
}
