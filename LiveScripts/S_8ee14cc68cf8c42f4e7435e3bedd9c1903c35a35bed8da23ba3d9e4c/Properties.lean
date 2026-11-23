import LiveScripts.Shared
import LiveScripts.S_8ee14cc68cf8c42f4e7435e3bedd9c1903c35a35bed8da23ba3d9e4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8ee14cc68cf8c42f4e7435e3bedd9c1903c35a35bed8da23ba3d9e4c.script [datum, redeemer, ctx] 10000]
