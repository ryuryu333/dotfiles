let { SingleElementArray } = import "../../../util/contract.ncl",
in
{
  GithubRepositoryRulesetSchema = {
    name | String,
    repository | String,
    enforcement
      | [| 'active, 'disabled, 'evaluate |]
      | doc "evaluate is currently only supported for owners of type organization."
      | default
      = 'active,
    bypass_actors
      | optional
      | doc "Don't use, if needed, make schema.",
    target
      | [| 'branch, 'tag, 'push |],
    conditions
      | Array Dyn
      | SingleElementArray
      | optional,
    rules
      | Array Dyn
      | SingleElementArray,
  },
}
