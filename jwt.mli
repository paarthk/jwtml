type algorithm = 
	| HS256
	| HS384
	| HS512

type t

type key = algorithm * string

(* parse does not actually do any validation. Is this worthwhile to publish?*)
val parse : string -> t (*TODO: T result*)

val encode : key -> t -> string

val decode : key -> string -> t option

(* claim manipulation *)
val claim : string -> t -> Yojson.Basic.json

val add_claim : string -> Yojson.Basic.json -> t -> t

(* Meta info *)
val alg : t -> algorithm option
(* I actually kind of hate this because 
NO alg specified, invalid alg specified,
and unsupported alg specified are three
different things *)

(* registered claims *)
val iss : t -> string option
val sub : t -> string option
val aud : t -> string option

val exp : t -> int option
val nbf : t -> int option
val iat : t -> int option
val jti : t -> int option
