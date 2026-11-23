import LiveScripts.Shared
import LiveScripts.S_e97716c881588b07c3732e849b49e438430d5786a04f83fed4cb11d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e97716c881588b07c3732e849b49e438430d5786a04f83fed4cb11d8.script [ctx] 10000]
