import LiveScripts.Shared
import LiveScripts.S_094b62e37c2be06a1c9deae4346f40315932f05ee8a3634d6d46601e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_094b62e37c2be06a1c9deae4346f40315932f05ee8a3634d6d46601e.script [datum, redeemer, ctx] 10000]
