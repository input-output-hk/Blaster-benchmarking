import LiveScripts.Shared
import LiveScripts.S_ea61959e04f69381e8c9c366725892e900d8a64e882caeb7a731c693.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea61959e04f69381e8c9c366725892e900d8a64e882caeb7a731c693.script [ctx] 10000]
