import LiveScripts.Shared
import LiveScripts.S_2bebb2d8e8e96953722f3f777ce7454ade1475844c871100542156a8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2bebb2d8e8e96953722f3f777ce7454ade1475844c871100542156a8.script [datum, redeemer, ctx] 10000]
