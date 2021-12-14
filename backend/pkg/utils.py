def str_to_bool(bword: str) -> bool:
    return bword.lower() in ("yes", "true", "t", "1")


# def value_or_none(d: dict, key: str) -> Union[str, None]:
#    if key in d:
#        return dict[key]
#    else:
#        return None
