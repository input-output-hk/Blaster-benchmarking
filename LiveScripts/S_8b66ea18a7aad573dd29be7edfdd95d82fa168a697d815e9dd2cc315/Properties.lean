import LiveScripts.Shared
import LiveScripts.S_8b66ea18a7aad573dd29be7edfdd95d82fa168a697d815e9dd2cc315.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b66ea18a7aad573dd29be7edfdd95d82fa168a697d815e9dd2cc315.script [ctx] 10000]
