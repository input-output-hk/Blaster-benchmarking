import LiveScripts.Shared
import LiveScripts.S_32ed1c6cedee2fda27d28cd18d26661e1b60662e6b450ae0b68ef596.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_32ed1c6cedee2fda27d28cd18d26661e1b60662e6b450ae0b68ef596.script [ctx] 10000]
