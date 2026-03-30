# RapierWorldDestroy

`RapierWorldDestroy[worldId]` cleans up a simulation world and releases its assigned ID.

## Usage

```wolfram
RapierWorldDestroy[worldId]
```
- `worldId`: The ID of the simulation world to destroy.
- Returns `True` if the world was successfully destroyed, and `False` otherwise.

## Details and Notes

- This function should be called when a simulation world is no longer needed to release memory and resources.
- If multiple simulation worlds are active, each should be destroyed individually.
- Once a world ID has been destroyed, it can no longer be used in other functions until it is reassigned by `RapierWorldCreate`.

## Examples

### Basic Example
Create and then destroy a simulation world:
```wolfram
worldId = RapierWorldCreate[{0, 0, -9.81}];
RapierWorldDestroy[worldId]
(* True *)
```
