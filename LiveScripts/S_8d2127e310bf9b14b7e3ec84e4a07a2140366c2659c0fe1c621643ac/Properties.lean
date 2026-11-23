import LiveScripts.Shared
import LiveScripts.S_8d2127e310bf9b14b7e3ec84e4a07a2140366c2659c0fe1c621643ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8d2127e310bf9b14b7e3ec84e4a07a2140366c2659c0fe1c621643ac.script [ctx] 10000]
